module ApplicationHelper
  include Pagy::Frontend

  def current_user
    Current.user
  end

  def user_signed_in?
    Current.user.present?
  end

  def current_user_name
    Current.user.email_address.split("@").first.titleize if Current.user
  end
end
