class User < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  set_table_name :mail_users
  has_many :groups
  validates_presence_of :guid
  
  def name
    "#{first_name} #{last_name}"
  end
  memoize :name
  
end
