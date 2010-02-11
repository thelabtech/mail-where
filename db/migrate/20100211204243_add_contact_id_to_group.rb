class AddContactIdToGroup < ActiveRecord::Migration
  def self.up
    add_column :mail_groups, :contact_id, :string, :length => 1000
  end

  def self.down
    remove_column :mail_groups, :contact_id
  end
end
