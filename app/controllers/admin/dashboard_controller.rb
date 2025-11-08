class Admin::DashboardController < ApplicationController
  before_action :ensure_admin_user

  def index
    @user_count = User.count
    @all_offers_count = Offer.count
    @recent_offers = Offer.order(created_at: :desc).limit(10)
    @published_offers_count = Offer.where(status: :published).count
    @applications_count = Statistic.where(stat_type: :application).count
    @pending_offers_count = Offer.where(verification_status: :pending).count
    render layout: "dashboard"
  end

  private

  def ensure_admin_user
    unless Current.user.admin?
      redirect_to offers_path, alert: "You are not authorized to access this page."
    end
  end
end
