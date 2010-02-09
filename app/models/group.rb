class Group < ActiveRecord::Base
  set_table_name 'mail_groups'
  has_many :members, :dependent => :destroy
  validates_presence_of :group_id, :group_name, :group_description
  validates_format_of :group_id, :with => /^([^\s]+)$/i
  validates_uniqueness_of :group_id, :on => :create, :message => "must be unique"
  after_validation :create_google_group, :on => :create
  after_update :queue_delayed_jobs
  before_destroy :delete_group
  
  def self.pull_groups_from_google
    GoogleGroupsApi.groups.each do |gg|
      group_id = gg.group_id.to_s.sub('@cojourners.com', '')
      attributes = {:group_id => group_id, :group_name => gg.group_name, :group_description => gg.group_description, 
                    :email_permission => gg.email_permission, :exists_on_google => true}
      if group = self.where(:group_id => group_id).first
        group.update_attributes!(attributes)
      else
        Group.create!(attributes) 
      end
                      
    end
  end
  
  def members_from_google
    @members ||=  GoogleGroupsApi.members(group_id)
  end
  
  def all_addresses
    @all_addresses ||= members.collect(&:email)
  end
  
  def addresses
    unless @addresses
      return ['No query specified'] if email_query.blank?
      begin 
        @addresses = Group.connection.select_values(email_query).map(&:downcase)
      rescue
        @addresses = query_error
      end
    end
    @addresses
  end
  
  def old_addresses
    return [] if email_query == email_query_was
    unless @old_addresses
      return ['No query specified'] if email_query_was.blank?
      begin 
        @old_addresses = Group.connection.select_values(email_query_was).map(&:downcase)
      rescue
        @old_addresses = query_error
      end
    end
    @old_addresses
  end
  
  def create_google_group
    GoogleGroupsApi.create_group(self)
    self.exists_on_google = true
  end
  
  def update_google_group
    if GoogleGroupsApi.group_exists?(group_id)
      logger.debug("doesn't exist")
      GoogleGroupsApi.update_group(self)
    else
      logger.debug("doesn't exist")
      GoogleGroupsApi.create_group(self)
    end
  end
  
  def update_members
    if email_query.present? && addresses != query_error && (old_addresses != addresses)
      to_delete = old_addresses - addresses
      Member.delete_all({:id => to_delete, :group_id => self.id})
      
      to_add = addresses - old_addresses
      to_add.each {|a| self.members.create(:email => a)}
    end
  end
  # 
  # def update_google_members
  #   to_delete = members_from_google - all_addresses
  #   logger.debug(to_delete.inspect)
  #   to_delete.map {|m| GoogleGroupsApi.delete_member(m, group_id)}
  #   
  #   to_add = all_addresses - members_from_google
  #   logger.debug(to_add.inspect)
  #   to_add.map {|m| GoogleGroupsApi.add_member(m, group_id)}
  # end
  
  def queue_delayed_jobs
    self.send_later(:update_google_group)
    self.send_later(:update_members)
    # self.send_later(:update_google_members)
  end
  
  protected
    def query_error
      ['There was an error running your query']
    end
end
