class DashboardController < ApplicationController
  before_action :set_filters, only: [ :index ]

  def index
    @pagy, @offers = pagy(Current.user.offers, limit: @limit)
  end

  private
  def set_filters
    @limit = params[:limit] || 9
    @sort = params[:sort] || "created_at desc"
    @location = params[:location]
    @range = params[:range] || 100
    @unit = params[:unit] || "km"

    if @location.blank?
      if request.location.city.present? && !request.location.city.blank?
        @location = request.location.city + ", " + request.location.country
      else
        @location = "Paris, France"
      end
    end
  end
end
