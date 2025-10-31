class HomeController < ApplicationController
  allow_unauthenticated_access
  before_action :resume_session, only: [ :index ]

  def index
    @q = Offer.ransack(params[:q])
    @offers = Offer.all.limit(3).order(created_at: :desc)
  end
end
