module Responder
  class FancygridResponder < ActionController::Responder
    
    def to_csv
      raise "Fancygrid to CSV"
    end
  end
end
