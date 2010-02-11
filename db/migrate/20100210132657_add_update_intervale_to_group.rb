class AddUpdateIntervaleToGroup < ActiveRecord::Migration
  def self.up
    add_column :mail_groups, :update_interval, :string, :default => 'Daily'
  end

  def self.down
    remove_column :mail_groups, :update_interval
  end
end
