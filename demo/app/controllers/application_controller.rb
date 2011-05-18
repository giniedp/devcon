# app/controllers/application_controller.rb
#require "app_responder"
  
class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Renderer::PdfRenderer
  include Renderer::CsvRenderer
  
  protect_from_forgery
  self.responder = Responder::ApplicationResponder
  respond_to :html, :xml, :pdf, :csv
    
  def index
  end
end
