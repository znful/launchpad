module ApplicationHelper
  include Pagy::Frontend

  def current_user
    Current.user
  end

  def user_signed_in?
    Current.user.present?
  end
end
