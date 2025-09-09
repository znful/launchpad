class DashboardController < ApplicationController
  before_action :set_filters, only: [ :index ]

  def index
    # FIX: For some reason Current is not available in the view ?
    # Need to figure out why because it breaks the navbar
    @q = Current.user.offers.ransack(params[:q])
    if @location.blank?
      @pagy, @offers = pagy(@q.result.order(@sort), limit: @limit)
    else
      @pagy, @offers = pagy(@q.result.near(@location, @range, units: @unit).order(@sort), limit: @limit)
    end
  end

  private
  def set_filters
    @limit = params[:limit] || 9
    @sort = params[:sort] || "created_at desc"
    @location = params[:location]
    @range = params[:range] || 100
    @unit = params[:unit] || "km"
  end
end
