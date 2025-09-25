class DashboardController < ApplicationController
  before_action :set_filters, only: [ :index ]

  def index
    @q = Current.user.offers.ransack(params[:q])

    if @status.present?
      @pagy, @offers = pagy(@q.result.near(@location, @range).where(status: @status).order(@sort), limit: @limit) if @location.present? && @range.present?
      @pagy, @offers = pagy(@q.result.order(@sort).where(status: @status), limit: @limit) if @location.nil? || @location.empty?
    else
      @pagy, @offers = pagy(@q.result.near(@location, @range).order(@sort), limit: @limit) if @location.present? && @range.present?
      @pagy, @offers = pagy(@q.result.order(@sort), limit: @limit) if @location.nil? || @location.empty?
    end

    @view_count = @offers.views.count
    @interaction_count = @offers.interactions.count
    @application_count = @offers.applications.count
    render :index, layout: "dashboard"
  end

  private

  def set_filters
    @limit = params[:limit] || 9
    @sort = params[:sort] || "created_at desc"
    @location = params[:location]
    @range = params[:range] || 50
    @status = params[:status] || ""
  end
end
