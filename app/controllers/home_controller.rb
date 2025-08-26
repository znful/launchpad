class HomeController < ApplicationController
  def index
    @q = Offer.ransack(params[:q])
  end
end
