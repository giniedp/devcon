require "fileutils"

module Renderer
  module PdfRenderer

    ActionController::Renderers.add :pdf do |resource, options|
      Tools::Fop.render_pdf({
        :xml => resource.to_pdf,
        :xsl => Rails.root.join("app", "views", "xsl", "generic.xsl")
      }) do |pdf, success, error|
        if success
          send_data(File.read(pdf), :filename => "output.pdf", :content_type => "application/pdf", :disposition => "inline")
        else 
          render_to_string :file => Rails.root.join("public", "500.html").to_s, :status => 500
        end
      end
    end
    
    
  end
end