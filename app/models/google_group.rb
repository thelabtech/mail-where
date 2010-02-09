class GoogleGroup
  attr_accessor :group_id, :group_name, :group_description, :email_permission
  
  def initialize(entry)
    id_entry = entry.extended_elements.detect {|ee| ee.attributes['name'] == 'groupId'}
    self.group_id = id_entry.attributes['value'] if id_entry
    
    name_entry = entry.extended_elements.detect {|ee| ee.attributes['name'] == 'groupName'}
    self.group_name = name_entry.attributes['value'] if name_entry
    
    description_entry = entry.extended_elements.detect {|ee| ee.attributes['name'] == 'description'}
    self.group_description = description_entry.attributes['value'] if description_entry
    
    permission_entry = entry.extended_elements.detect {|ee| ee.attributes['name'] == 'emailPermission'}
    self.email_permission = permission_entry.attributes['value'] if permission_entry
  end
end