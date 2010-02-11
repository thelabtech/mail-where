class ApplicationController < ActionController::Base
  # include ExceptionNotifiable
  before_filter CASClient::Frameworks::Rails::Filter
  protect_from_forgery
end
