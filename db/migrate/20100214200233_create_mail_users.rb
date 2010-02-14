class CreateMailUsers < ActiveRecord::Migration
  def self.up
    create_table :mail_users do |t|
      t.string :guid
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :designation
      t.string :employee_id
      t.boolean :admin, :default => false
      t.timestamps
    end
    
    add_column :mail_groups, :user_id, :integer
    add_index :mail_groups, :user_id
  end

  def self.down
    remove_index :mail_groups, :user_id
    remove_column :mail_groups, :user_id
    drop_table :mail_users
  end
end
