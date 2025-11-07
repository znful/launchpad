class Admin::DashboardController < ApplicationController
  before_action :ensure_admin_user

  def index
    @user_count = User.count
    @offer_count = Offer.count
    @recent_users = User.order(created_at: :desc).limit(5)
    @recent_offers = Offer.order(created_at: :desc).limit(5)
    @pending_offers = Offer.where(status: "pending").count
  end

  private

  def ensure_admin_user
    unless Current.user.admin?
      redirect_to offers_path, alert: "You are not authorized to access this page."
    end
  end
end
