class BookmarksController < ApplicationController
  before_action :set_offer, only: [ :create, :destroy ]

  def create
    current_user.bookmarks.create!(offer: @offer)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    bookmark.destroy
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
