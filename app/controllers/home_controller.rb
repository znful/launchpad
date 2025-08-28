class HomeController < ApplicationController
  allow_unauthenticated_access only: [ :index ]

  def index
    @q = Offer.ransack(params[:q])
  end
end
