class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :mail_groups do |t|
      t.string :group_id
      t.string :group_name
      t.string :group_description
      t.string :email_permission, :default => 'Domain'
      t.text   :email_query
      t.boolean :exists_on_google, :default => false
      t.timestamps
    end
    add_index :mail_groups, :group_id
  end

  def self.down
    remove_index :mail_groups, :group_id
    drop_table :mail_groups
  end
end
