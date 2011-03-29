class GoogleGroup
  attr_accessor :group_id, :group_name, :group_description, :email_permission
  
  def initialize(entry)
    id_entry = (entry/'[@name="groupId"]')
    self.group_id = id_entry.attr('value') if id_entry
    
    name_entry = (entry/'[@name="groupName"]')
    self.group_name = name_entry.attr('value') if name_entry
    
    description_entry = (entry/'[@name="description"]')
    self.group_description = description_entry.attr('value') if description_entry
    
    permission_entry = (entry/'[@name="emailPermission"]')
    self.email_permission = permission_entry.attr('value') if permission_entry
  end
end