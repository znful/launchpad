class HomeController < ApplicationController
  allow_unauthenticated_access

  def index
    @q = Offer.ransack(params[:q])
    @offers = Offer.all.limit(3).order(created_at: :desc).where(status: :published)
  end
end
