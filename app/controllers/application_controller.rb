class ApplicationController < ActionController::Base
  # include ExceptionNotifiable
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :harvest_cas_attributes
  before_filter :block_non_staff, :except => :denied if Rails.env.production?
  before_filter :find_or_create_user
  
  protect_from_forgery
  
  def harvest_cas_attributes
    session[:cas_extra_attributes].each {|k,v| session[k] = v}
  end
  
  def block_non_staff
    unless session[:emplid].present?
      redirect_to denied_path
      return false
    end
  end
  
  def current_user
    @current_user
  end
  helper_method :current_user
  
  def find_or_create_user
    @current_user = User.find_by_guid(session[:ssoGuid]) 
    attributes = {:guid => session[:ssoGuid], :first_name => session[:firstName], :last_name => session[:lastName], :designation => session[:designation], :employee_id => session[:emplid], :email => session[:cas_user].downcase}
    if @current_user
      # update attributes once per session
      unless session[:user_updated]
        @current_user.update_attributes(attributes) 
        session[:user_updated] = true
      end
    else
      @current_user = User.create(attributes)
    end
    @current_user
  end
end
