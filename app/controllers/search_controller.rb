class SearchController < ApplicationController
  def index
  end

  def show
    @offers = Offer.where("title ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
  end
end
