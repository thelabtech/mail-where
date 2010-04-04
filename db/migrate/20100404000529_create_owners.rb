class CreateOwners < ActiveRecord::Migration
  def self.up
    create_table :mail_owners do |t|
      t.integer :group_id
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :owners
  end
end
