class DashboardController < ApplicationController
  before_action :set_filters, only: [ :index ]

  def index
    @q = Current.user.offers.ransack(params[:q])
    if @location.blank?
      @pagy, @offers = pagy(@q.result(distinct: true)
        .where(status: @status)
        .order(@sort),
      limit: @limit)
    else
      @pagy, @offers = pagy(@q.result(distinct: true)
        .near(@location, @range)
        .where(status: @status)
        .order(@sort),
      limit: @limit)
    end
    @view_count = @offers.views.count
    @interaction_count = @offers.interactions.count
    @application_count = @offers.applications.count
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
