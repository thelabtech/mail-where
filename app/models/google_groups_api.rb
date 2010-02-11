class GoogleGroupsApi
  @@auth = nil
  @@auth_updated_at = nil
  @@groups = nil
  
  def self.auth
    if !@@auth || !@@auth_updated_at || @@auth_updated_at < 23.hours.ago
      auth_response = ''
      while auth_response == '' do
        auth_response = post_no_auth("https://www.google.com/accounts/ClientLogin", ['Email=admin@cojourners.com',
                                                                       'Passwd=CCCroxyoursox',
                                                                       'accountType=HOSTED',
                                                                       'service=apps'])
      end
      
      begin
        @@auth = auth_response.split("\n").last.split('=').last
      rescue
        raise auth_response.inspect
      end
      @@auth_updated_at = Time.now
    end
    @@auth
  end
  
  def self.groups
    unless @@groups
      response = get("https://apps-apis.google.com/a/feeds/group/2.0/cojourners.com")
      feed = Atom::Feed.new(response)
      @@groups = feed.entries.collect {|e| GoogleGroup.new(e)}
    end
  end
  
  def self.members(group_id)
    members = []
    response = get("https://apps-apis.google.com/a/feeds/group/2.0/cojourners.com/#{group_id}/member")
    feed = Atom::Feed.new(response)
    feed.entries.each do |entry|
      members << entry.extended_elements.detect {|ee| ee.attributes['name'] == 'memberId'}.attributes['value']
    end
    members
  end
  
  def self.create_group(group)
    atom = '<atom:entry xmlns:atom="http://www.w3.org/2005/Atom" xmlns:apps="http://schemas.google.com/apps/2006" xmlns:gd="http://schemas.google.com/g/2005">'
    atom += "<apps:property name=\"groupId\" value=\"#{group.group_id}\"></apps:property>"
    atom += "<apps:property name=\"groupName\" value=\"#{group.group_name.gsub('"','\'')}\"></apps:property>"
    atom += "<apps:property name=\"description\" value=\"#{group.group_description.gsub('"','\'')}\"></apps:property>"
    atom += "<apps:property name=\"emailPermission\" value=\"#{group.email_permission}\"></apps:property>"
    atom += '</atom:entry>'

    c = post("https://apps-apis.google.com/a/feeds/group/2.0/cojourners.com", atom)

    # Add an owner
    atom = '<atom:entry xmlns:atom="http://www.w3.org/2005/Atom" xmlns:apps="http://schemas.google.com/apps/2006" xmlns:gd="http://schemas.google.com/g/2005">'
    atom += '<apps:property name="email" value="admin@cojourners.com"/>'
    atom += '</atom:entry>'

    c = post("https://apps-apis.google.com/a/feeds/group/2.0/cojourners.com/#{group.group_id}/owner", atom)
  end
  
  def self.update_group(group)
    atom = '<atom:entry xmlns:atom="http://www.w3.org/2005/Atom" xmlns:apps="http://schemas.google.com/apps/2006" xmlns:gd="http://schemas.google.com/g/2005">'
    atom += "<apps:property name=\"groupId\" value=\"#{group.group_id}\"></apps:property>"
    atom += "<apps:property name=\"groupName\" value=\"#{group.group_name.gsub('"','\'')}\"></apps:property>"
    atom += "<apps:property name=\"description\" value=\"#{group.group_description.gsub('"','\'')}\"></apps:property>"
    atom += "<apps:property name=\"emailPermission\" value=\"#{group.email_permission}\"></apps:property>"
    atom += '</atom:entry>'

    put("https://apps-apis.google.com/a/feeds/group/2.0/cojourners.com/#{group.group_id}", atom)
  end
  
  def self.group_exists?(group_id)
    response = get("https://apps-apis.google.com/a/feeds/group/2.0/cojourners.com/#{group_id}")
    feed = Atom::Feed.new(response)
    !feed.links.empty?
  end
  
  def self.delete_group(group_id)
    delete("https://apps-apis.google.com/a/feeds/group/2.0/cojourners.com/#{group_id}")
  end
  
  def self.delete_member(member_id, group_id)
    delete("https://apps-apis.google.com/a/feeds/group/2.0/cojourners.com/#{group_id}/member/#{member_id}")
  end
  
  def self.add_member(member_id, group_id)
    atom = '<atom:entry xmlns:atom="http://www.w3.org/2005/Atom" xmlns:apps="http://schemas.google.com/apps/2006" xmlns:gd="http://schemas.google.com/g/2005">'
    atom += "<apps:property name=\"memberId\" value=\"#{member_id}\"/>"
    atom += '</atom:entry>'
    
    c = post("https://apps-apis.google.com/a/feeds/group/2.0/cojourners.com/#{group_id}/member", atom)
  end
  
  protected 
    def self.post(url, data)
      response = `curl -X POST #{curl_headers} #{url} #{data_clause(data)}`
      Rails.logger.debug('=================================================')
      Rails.logger.debug(url)
      Rails.logger.debug(response)
      Rails.logger.debug(data)
      Rails.logger.debug('=================================================')
      response
    end
    
    def self.post_no_auth(url, data)
      response = `curl -X POST #{url} #{data_clause(data)}`
    end
    
    def self.get(url)
      response = `curl #{curl_headers} #{url}`
      
      Rails.logger.debug('=================================================')
      Rails.logger.debug(url)
      Rails.logger.debug(response.inspect)
      Rails.logger.debug('=================================================')
      response
    end
    
    def self.put(url, data)
      `curl -X PUT #{curl_headers} #{url} #{data_clause(data)}`
    end
    
    def self.delete(url)
      `curl -X DELETE #{curl_headers} #{url}`
    end
    
    def self.curl_headers
      "--header \"Content-type: application/atom+xml\" --header \"Authorization: GoogleLogin auth=#{auth}\""
    end
    
    def self.set_headers(curl)
      curl.headers["Content-type"] = "application/atom+xml"
      curl.headers["Authorization"] = "GoogleLogin auth=#{auth}"
      curl.verbose = true
      curl 
    end
    
    def self.data_clause(data)
      data = Array.wrap(data)
      data_clause = data.collect {|d| "-d \"#{d.gsub('"','\"')}\""}.join(' ')
    end
      
end