# app/controllers/application_controller.rb
require "app_responder"
  
class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery
  self.responder = AppResponder
  respond_to :html
    
  def index
  end
end
