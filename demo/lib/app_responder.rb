# lib/app_responder.rb
class AppResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder
  include Responders::CollectionResponder
end