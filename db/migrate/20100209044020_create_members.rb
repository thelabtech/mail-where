class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :mail_members do |t|
      t.integer :group_id
      t.string :email
      t.boolean :exception, :default => 0
      t.timestamps
    end
    add_index :mail_members, :group_id
  end

  def self.down
    remove_index :mail_members, :group_id
    drop_table :members
  end
end
