class Group < ActiveRecord::Base
  set_table_name 'mail_groups'
  has_many :members, :dependent => :delete_all
  validates_presence_of :group_id, :group_name, :group_description
  validates_format_of :group_id, :with => /^([^\s]+)$/i
  validates_uniqueness_of :group_id, :group_name, :on => :create, :message => "must be unique"
  after_save :queue_delayed_jobs
  before_destroy :queue_delete_google_group
  
  scope :daily_updates, where(:update_interval => 'Daily')
  scope :weekly_updates, where(:update_interval => 'Weekly')
  
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
  
  def self.update_daily_groups
    Group.daily_updates.each {|g| g.update_google_members}
  end
  
  def self.update_weekly_groups
    Group.weekly_updates.each {|g| g.update_google_members}
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
  
  def update_google_group
    if GoogleGroupsApi.group_exists?(group_id)
      logger.debug("group exists")
      GoogleGroupsApi.update_group(self)
    else
      logger.debug("doesn't exist")
      GoogleGroupsApi.create_group(self)
      self.update_attribute(:exists_on_google, true)
    end
  end
  
  def update_members
    if email_query.present? && addresses != query_error && (old_addresses != addresses)
      to_delete = old_addresses - addresses
      Member.delete_all({:id => to_delete, :group_id => self.id}) if to_delete.present?
      
      to_add = addresses - old_addresses
      to_add.each {|a| self.members.create(:email => a)}
    end
  end
  
  def update_google_members
    to_delete = members_from_google - all_addresses
    logger.debug(to_delete.inspect)
    to_delete.map {|m| GoogleGroupsApi.delete_member(m, group_id)}
    
    to_add = all_addresses - members_from_google
    logger.debug(to_add.inspect)
    to_add.map {|m| GoogleGroupsApi.add_member(m, group_id)}
  end
  
  # If the query has changed, or the data under the query has changed, we need to update the member list
  def refresh!
    old_addresses = members.collect(&:email)
    to_delete = old_addresses - addresses
    Member.delete_all({:id => to_delete, :group_id => self.id})
    
    to_add = addresses - old_addresses
    to_add.each {|a| self.members.create(:email => a)}
    
    # and also update google.
    self.send_later(:update_google_members)
  end
  
  def queue_delayed_jobs
    self.send_later(:update_google_group)
    self.send_later(:update_google_members)
  end
  
  def queue_delete_google_group
    self.send_later(:delete_google_group)
  end
  
  def queue_create_google_group
    self.send_later(:create_google_group)
  end
  
  def delete_google_group
    GoogleGroupsApi.delete_group(self)
  end
  
  protected
    def query_error
      ['There was an error running your query']
    end
end
