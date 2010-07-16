class Group < ActiveRecord::Base
  set_table_name 'mail_groups'
  belongs_to :user
  has_many :members, :dependent => :delete_all
  has_many :owners, :dependent => :delete_all
  has_many :query_members, :class_name => "Member", :foreign_key => "group_id", :conditions => 'mail_members.exception = 0'
  has_many :query_owners, :class_name => "Owner", :foreign_key => "group_id", :conditions => 'mail_owners.exception = 0'
  validates_presence_of :group_id, :group_name, :group_description
  validates_format_of :group_id, :with => /^[\w\.%\+\-]+$/i
  validates_uniqueness_of :group_id, :group_name, :on => :create, :message => "must be unique"
  validate :query_valid_sql
  # validates_each :group_id do |record, attr, value|
  #   record.errors.add attr, 'cannot start with the word "test"' if value.to_s[0..3] == 'test'
  # end
  after_validation :update_members, :update_owners, :queue_update_google_group, :on => :update
  after_validation :create_google_group, :on => :create
  after_create :update_members, :update_owners, :queue_user_and_shared_contact, :queue_update_google_members, :queue_update_google_owners
  
  before_destroy :queue_delete_google_group
  
  def query_valid_sql
    #Check member email query
    if email_query.present? 
      begin
        Group.connection.select_values(email_query).present?
      rescue ActiveRecord::StatementInvalid
        errors.add_to_base("There is an SQL error in your member query.") 
      end
    end
    
    #Check owner email query
    if owners_email_query.present? 
      begin
        Group.connection.select_values(owners_email_query).present?
      rescue ActiveRecord::StatementInvalid
        errors.add_to_base("There is an SQL error in your owner query.") 
      end
    end
  end
  
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
    Group.daily_updates.each {|g| 
    g.update_google_members
    g.update_google_owners}
  end
  
  def self.update_weekly_groups
    Group.weekly_updates.each {|g| 
    g.update_google_members
    g.update_google_owners}
  end
  
  def members_from_google
    @members_from_google ||=  GoogleGroupsApi.members(self)
  end
  
  def owners_from_google
    @owners_from_google ||= GoogleGroupsApi.owners(self)
  end
  
  def all_addresses
    @all_addresses ||= members.collect(&:email) + owners.collect(&:email)
  end
  
  def member_addresses
    unless @member_addresses
      return ['No member query specified'] if email_query.blank?
      begin 
        @member_addresses = Group.connection.select_values(email_query).map(&:downcase)
      rescue
        @member_addresses = query_error
      end
    end
    @member_addresses
  end
  
  def owner_addresses
    unless @owner_addresses
      return ['No owner query specified'] if owners_email_query.blank?
      begin 
        @owner_addresses = Group.connection.select_values(owners_email_query).map(&:downcase)
      rescue
        @owner_addresses = query_error
      end
    end
    @owner_addresses
  end
  
  def old_member_addresses
    return [] if email_query == email_query_was
    unless @old_member_addresses
      return ['No member query specified'] if email_query_was.blank?
      begin 
        @old_member_addresses = self.query_members.collect(&:email)
      rescue
        @old_member_addresses = query_error
      end
    end
    @old_member_addresses
  end
  
  def old_owner_addresses
    return [] if owners_email_query == owners_email_query_was
    unless @old_owner_addresses
      return ['No owner query specified'] if owners_email_query_was.blank?
      begin 
        @old_owner_addresses = self.query_owners.collect(&:email)
      rescue
        @old_owner_addresses = query_error
      end
    end
    @old_owner_addresses
  end
  
  
  def create_google_group
    begin
      GoogleGroupsApi.create_group(self)
    rescue EntityExists
      self.update_attribute(:exists_on_google, true) unless new_record?
      raise
    end
  end
  
  def update_google_group
    if GoogleGroupsApi.group_exists?(group_id)
      logger.debug("group exists")
      GoogleGroupsApi.update_group(self)
    else
      logger.debug("doesn't exist")
      create_google_group
    end
    update_attribute(:exists_on_google, true)
    update_google_members
    update_google_owners
  end
  
  def update_members
      to_delete = old_member_addresses - member_addresses
      Member.delete_all({:email => to_delete, :group_id => self.id}) if to_delete.present?
      
      to_add = member_addresses - old_member_addresses
      to_add.each {|a| self.members.create(:email => a)}
  end
  
   def update_owners
      to_delete = old_owner_addresses - owner_addresses
      Owner.delete_all({:email => to_delete, :group_id => self.id}) if to_delete.present?
      
      to_add = owner_addresses - old_owner_addresses
      to_add.each {|a| self.owners.create(:email => a)}
  end
  
  def update_google_members
    to_delete = members_from_google - member_addresses
    logger.debug(to_delete.inspect)
    to_delete.map {|m| GoogleGroupsApi.delete_member(m, group_id)}
  
    to_add = member_addresses - members_from_google
    logger.debug(to_add.inspect)
    to_add.map {|m| GoogleGroupsApi.add_member(m, group_id)}
  end
  
  def update_google_owners
    to_delete = owners_from_google - owner_addresses
    logger.debug(to_delete.inspect)
    to_delete.map {|m| GoogleGroupsApi.delete_owner(m, group_id)}
  
    to_add = owner_addresses - owners_from_google
    logger.debug(to_add.inspect)
    to_add.map {|m| GoogleGroupsApi.add_owner(m, group_id)}
  end
  
  # If the query has changed, or the data under the query has changed, we need to update the member list
  def refresh!
    update_members
    update_owners
    
    # and also update google.
    self.send_later(:update_google_members)
    self.send_later(:update_google_owners)
    
  end
  
  protected
    def query_error
      ['There was an error running your query']
    end
    
    def queue_user_and_shared_contact
      GoogleGroupsApi.send_later(:create_shared_contact, self)
      GoogleGroupsApi.send_later(:add_default_user, group_id)
    end
  
    def queue_update_google_group
      self.send_later(:update_google_group)
    end
  
    def queue_update_google_members
      self.send_later(:update_google_members)
    end
    
    def queue_update_google_owners
      self.send_later(:update_google_owners)
    end
  
    def queue_delete_google_group
      GoogleGroupsApi.send_later(:delete_group, group_id)
      GoogleGroupsApi.send_later(:delete_shared_contact, contact_id) if contact_id.present?
    end
end
