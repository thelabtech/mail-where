class Member < ActiveRecord::Base
  set_table_name 'mail_members'
  belongs_to :group
  validates_presence_of :email
  validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  validates_uniqueness_of :email, :scope => :group_id, :message => "is already on the list"
  
  after_save :add_to_google
  before_destroy :remove_from_google
  
  scope :exceptions, where(:exception => true)
  
  def add_to_google
    # GoogleGroupsApi.add_member(email, group.group_id) if exception?
    GoogleGroupsApi.send_later(:add_member, email, group.group_id) if exception?
  end
  
  def remove_from_google
    # GoogleGroupsApi.delete_member(email, group.group_id) if exception?
    GoogleGroupsApi.send_later(:delete_member, email, group.group_id) if exception?
  end
end
