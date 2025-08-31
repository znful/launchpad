class DashboardController < ApplicationController
  before_action :set_offers, only: [ :index ]

  def index
  end

  private
  def set_offers
    @offers = Current.user.offers
  end
end
