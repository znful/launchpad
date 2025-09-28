class HomeController < ApplicationController
  def index
    @q = Offer.ransack(params[:q])
    @offers = Offer.all.limit(3).order(created_at: :desc)
  end
end
