class Run

  def self.weekly_tasks
    Group.update_weekly_groups
  end
  
  def self.daily_tasks
    Group.update_daily_groups
  end

end
