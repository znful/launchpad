class HomeController < ApplicationController
  def index
    @offers = Offer.all.limit(3).order(created_at: :desc)
  end
end
