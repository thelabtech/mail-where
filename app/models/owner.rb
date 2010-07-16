class Owner < ActiveRecord::Base
  set_table_name :mail_owners
  
  belongs_to :group
  validates_presence_of :email
  validates_format_of :email, :with => /\A[\w\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)\z/i
  validates_uniqueness_of :email, :scope => :group_id, :message => "is already an owner"
  
  after_save :add_to_google
  before_destroy :remove_from_google
  
  scope :exceptions, where(:exception => true)
    
  def add_to_google
    GoogleGroupsApi.send_later(:add_owner, email, group.group_id) 
  end
  
  def remove_from_google
    GoogleGroupsApi.send_later(:delete_owner, email, group.group_id) 
  end
end
