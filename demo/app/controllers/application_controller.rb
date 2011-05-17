# app/controllers/application_controller.rb
#require "app_responder"
  
class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Renderer::PdfRenderer
  
  protect_from_forgery
  self.responder = Responder::ApplicationResponder
  respond_to :html, :xml, :pdf
    
  def index
  end
end


