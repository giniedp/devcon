module Responder
  class ApplicationResponder < ActionController::Responder
    include Responders::FlashResponder
    include Responders::HttpCacheResponder
    include Responders::CollectionResponder
    
    def to_csv
      raise "ADASD"
    end
  end
end
