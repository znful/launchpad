class DashboardController < ApplicationController
  before_action :set_filters, only: [ :index ]

  def index
    @q = Offer.ransack(params[:q])
    @offer = Offer.new

    if @location.present? && @distance.present?
      location = params[:q][:location]
      distance = params[:q][:distance].to_f
      @pagy, @offers = pagy(@offers.near(location, distance, units: :km), limit: @limit)
    else
      @pagy, @offers = pagy(@q.result(distinct: true).order(created_at: :desc), limit: @limit)
    end

    @view_count = Current.user.offers.views.count
    @interaction_count = Current.user.offers.interactions.count
    @application_count = Current.user.offers.applications.count

    render :index, layout: "dashboard"
  end

  private

  def set_filters
    @limit = params[:limit] || 10
    @sort = params[:sort] || "created_at desc"
    @location = params.dig(:q, :location)
    @distance = params.dig(:q, :distance).to_f || 50
    @status = params[:status] || ""
  end
end
