class ApplicationController < ActionController::Base
  include Authentication
  include Pagy::Backend
  Pagy::DEFAULT[:limit] = 10
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
