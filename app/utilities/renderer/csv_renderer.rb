module Renderer
  module CsvRenderer

    ActionController::Renderers.add :csv do |resource, options|
      if options[:grid]
        fancygrid_csv resource, options[:grid]
      else 
        default_csv resource, options
      end
    end
    
    def fancygrid_csv records, grid      
      csv = ""
      grid.each_visible_leaf do |leaf|
        csv << "\"#{leaf.human_name.to_s}\";" 
      end
      csv << "\r\n"
      grid.each_record do |record|
        grid.each_visible_leaf do |leaf|
          csv << "\"#{leaf.value_from(record).to_s}\";" 
        end
        csv << "\r\n"
      end
      
      self.content_type ||= Mime::CSV
      self.render :text => csv, :layout => false
    end
    
    def default_csv csv, options
      self.content_type ||= Mime::CSV
      csv.respond_to?(:to_csv) ? csv.to_csv(options) : csv
    end
    
  end
end