class DashboardController < ApplicationController
  before_action :set_filters, only: [ :index ]

  def index
    @pagy, @offers = pagy(Current.user.offers)
    @view_count = @offers.views.count
    @interaction_count = @offers.interactions.count
    @application_count = @offers.applications.count
    p Current.user.offers
    render :index, layout: "dashboard"
  end

  private

  def set_filters
    @limit = params[:limit] || 10
    @sort = params[:sort] || "created_at desc"
    @location = params[:location] || nil
    @range = params[:range] || 100
    @status = params[:status]
  end
end
