require 'net/http'
require 'uri'

class EntityDoesNotExist < StandardError; end
class DuplicateContact < StandardError; end

class GoogleGroupsApi
  @@auth = nil
  @@auth_updated_at = nil
  @@contact_auth = nil
  @@contact_auth_updated_at = nil
  @@http = {}
  
  def self.groups
    response = get('apps-apis.google.com', '/a/feeds/group/2.0/cojourners.com')
    feed = Atom::Feed.new(response)
    feed.entries.collect {|e| GoogleGroup.new(e)}
  end
  
  def self.members(group)
    members = []
    begin
      response = get('apps-apis.google.com', "/a/feeds/group/2.0/cojourners.com/#{group.group_id}/member")
      feed = Atom::Feed.new(response)
      feed.entries.each do |entry|
        members << entry.extended_elements.detect {|ee| ee.attributes['name'] == 'memberId'}.attributes['value']
      end
      members
    rescue EntityDoesNotExist
      create_group(group)
      retry
    end
  end
  
  def self.owners(group)
    owners = []
    begin
      response = get('apps-apis.google.com', "/a/feeds/group/2.0/cojourners.com/#{group.group_id}/owner")
      feed = Atom::Feed.new(response)
      feed.entries.each do |entry|
        owners << entry.extended_elements.detect {|ee| ee.attributes['name'] == 'ownerID'}.attributes['value']
      end
      owners
    rescue EntityDoesNotExist
      create_group(group)
      retry
    end
  end
  
  def self.create_group(group)
    atom = '<atom:entry xmlns:atom="http://www.w3.org/2005/Atom" xmlns:apps="http://schemas.google.com/apps/2006" xmlns:gd="http://schemas.google.com/g/2005">'
    atom += "<apps:property name=\"groupId\" value=\"#{group.group_id}\"></apps:property>"
    atom += "<apps:property name=\"groupName\" value=\"#{group.group_name.gsub('"','\'')}\"></apps:property>"
    atom += "<apps:property name=\"description\" value=\"#{group.group_description.gsub('"','\'')}\"></apps:property>"
    atom += "<apps:property name=\"emailPermission\" value=\"#{group.email_permission}\"></apps:property>"
    atom += '</atom:entry>'

    c = post('apps-apis.google.com', '/a/feeds/group/2.0/cojourners.com', atom)
  end
  
  def self.add_default_user(group_id)
    begin
      add_owner('admin@cojourners.com', group_id)
    rescue Exception => e
      # Swallow this error. I dont' want to die on adding a default user
    end
  end
  
  def self.update_group(group)
    atom = '<atom:entry xmlns:atom="http://www.w3.org/2005/Atom" xmlns:apps="http://schemas.google.com/apps/2006" xmlns:gd="http://schemas.google.com/g/2005">'
    atom += "<apps:property name=\"groupId\" value=\"#{group.group_id}\"></apps:property>"
    atom += "<apps:property name=\"groupName\" value=\"#{group.group_name.gsub('"','\'')}\"></apps:property>"
    atom += "<apps:property name=\"description\" value=\"#{group.group_description.gsub('"','\'')}\"></apps:property>"
    atom += "<apps:property name=\"emailPermission\" value=\"#{group.email_permission}\"></apps:property>"
    atom += '</atom:entry>'

    put("apps-apis.google.com", "/a/feeds/group/2.0/cojourners.com/#{group.group_id}", atom)
  end
  
  def self.group_exists?(group_id)
    begin
      response = get("apps-apis.google.com", "/a/feeds/group/2.0/cojourners.com/#{group_id}")
      true
    rescue EntityDoesNotExist
      false
    end
  end
  
  def self.delete_group(group_id)
    begin
      delete("apps-apis.google.com", "/a/feeds/group/2.0/cojourners.com/#{group_id}")
    rescue
      # Fail silently if we can't delete the group from google.
    end
  end
  
  def self.delete_owner(email, group_id)
    delete("apps-apis.google.com", "/a/feeds/group/2.0/cojourners.com/#{group_id}/owner/#{email}")
  end
  
  def self.add_owner(email, group_id)
    atom = '<atom:entry xmlns:atom="http://www.w3.org/2005/Atom" xmlns:apps="http://schemas.google.com/apps/2006" xmlns:gd="http://schemas.google.com/g/2005">'
    atom += "<apps:property name=\"email\" value=\"#{email}\"/>"
    atom += '</atom:entry>'
    
    c = post("apps-apis.google.com", "/a/feeds/group/2.0/cojourners.com/#{group_id}/owner", atom)

  end
  
  def self.delete_member(member_id, group_id)
    delete("apps-apis.google.com", "/a/feeds/group/2.0/cojourners.com/#{group_id}/member/#{member_id}")
  end
  
  def self.add_member(member_id, group_id)
    atom = '<atom:entry xmlns:atom="http://www.w3.org/2005/Atom" xmlns:apps="http://schemas.google.com/apps/2006" xmlns:gd="http://schemas.google.com/g/2005">'
    atom += "<apps:property name=\"memberId\" value=\"#{member_id}\"/>"
    atom += '</atom:entry>'
    
    post("apps-apis.google.com", "/a/feeds/group/2.0/cojourners.com/#{group_id}/member", atom)
  end
  
  def self.create_shared_contact(group)
    atom = "<atom:entry xmlns:atom='http://www.w3.org/2005/Atom'
              xmlns:gd='http://schemas.google.com/g/2005'>
            <atom:category scheme='http://schemas.google.com/g/2005#kind'
              term='http://schemas.google.com/contact/2008#contact' />
            <atom:title type='text'>#{group.group_name}</atom:title>
            <gd:email rel='http://schemas.google.com/g/2005#home'
              address='#{group.group_id}@cojourners.com' />
          </atom:entry>"
    begin
      response = post("www.google.com", "/m8/feeds/contacts/cojourners.com/full", atom, true, true)
      feed = Atom::Feed.new(response)
    rescue DuplicateContact => body
      feed = Atom::Feed.new(body.message)
    end
    group.update_attribute(:contact_id, feed.id)
  end
  
  def self.delete_shared_contact(contact_id)
    uri = URI.parse(contact_id)
    # Get edit url from existing contact
    response = get(uri.host, uri.path, nil, true, true)
    feed = Atom::Feed.new(response)
    edit_link = feed.links.detect {|l| l.rel == 'edit'}.href
    
    # delete contact
    uri = URI.parse(edit_link)
    delete(uri.host, uri.path, nil, true, true)
  end
  
  protected 
    def self.contact_auth
      if !@@contact_auth || !@@contact_auth_updated_at || @@contact_auth_updated_at < 23.hours.ago
        auth_response = post('www.google.com','/accounts/ClientLogin', {'Email'=>'admin@cojourners.com', 'Passwd'=>'CCCroxyoursox', 'accountType' => 'HOSTED', 'service' => 'cp', 'source' => 'ccc-mailWhere'}, false)
        @@contact_auth = auth_response.split("\n").last.split('=').last
        @@contact_auth_updated_at = Time.now
      end
      @@contact_auth
    end
    
    def self.auth
      if !@@auth || !@@auth_updated_at || @@auth_updated_at < 23.hours.ago
        auth_response = post('www.google.com','/accounts/ClientLogin', {'Email'=>'admin@cojourners.com', 'Passwd'=>'CCCroxyoursox', 'accountType' => 'HOSTED', 'service' => 'apps'}, false)
        @@auth = auth_response.split("\n").last.split('=').last
        @@auth_updated_at = Time.now
      end
      @@auth
    end
    
    def self.send_request(host, req, data, authenticate, contact_auth)
      authenticate!(req, contact_auth) if authenticate
      if data
        if data.is_a?(Hash)
          req.set_form_data(data)
        else
          req.body = data
          req.set_content_type("application/atom+xml")
        end
      end
      response = http_with_host(host).start {|http| http.request(req) }
      if response.is_a?(Net::HTTPSuccess)
        response.body
      else
        case response.code 
        when '400'
          doc = Nokogiri::XML.parse(response.body)
          error = doc.at('error')
          if error
            case error.attributes['reason'].value
            when 'EntityExists'
              raise EntityExists, error
            when 'EntityDoesNotExist'
              raise EntityDoesNotExist, error
            else
              raise standard_error(response)
            end
          else
            raise standard_error(response)
          end
        when '409' # Duplicate contact
          raise DuplicateContact, response.body
        else
          raise standard_error(response)
        end
      end

    end
    
    def self.standard_error(response)
      response.code.inspect + ": " + response.message.inspect + ": " + response.body.inspect
    end
    
    def self.http_with_host(host)
      unless @@http[host]
        @@http[host] = Net::HTTP.new(host, 443)
        @@http[host].use_ssl = true
        @@http[host].verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      @@http[host]
    end
    

    def self.request_method(verb)
      Net::HTTP.const_get(verb.to_s.capitalize)
    end
    
    def self.authenticate!(request, use_contact_auth)
      if use_contact_auth
        request['Authorization'] = "GoogleLogin auth=#{contact_auth}"
      else
        request['Authorization'] = "GoogleLogin auth=#{auth}"
      end
    end
    
    [:get, :post, :put, :delete].each do |verb|
      class_eval(<<-EVAL, __FILE__, __LINE__)
        def self.#{verb}(host, path, data = nil, authenticate = true, contact_auth = false)
          req = request_method(:#{verb}).new(path)
          send_request(host, req, data, authenticate, contact_auth)
        end
      EVAL
    end
end