class StatisticsController < ApplicationController
  allow_unauthenticated_access only: %i[ create ]
  before_action :resume_session, only: %i[ create ]
  # POST /statistics or /statistics.json
  def create
    @statistic = Statistic.new(statistic_params)

    # Not incrementing stat if user is the owner of the offer
    offer = Offer.find_by(id: @statistic.offer_id)
    if Current.user && offer && offer.user_id == Current.user.id
      head :ok and return
    end

    location = Geocoder.search request.remote_ip
    if location.any? && !location.first.city.nil? && !location.first.country.nil?
      @statistic.location = "#{location.first.city}, #{location.first.country}"
    else
      @statistic.location = "Unknown"
    end

    respond_to do |format|
      if @statistic.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @statistic.errors, status: :unprocessable_content }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def statistic_params
      params.expect(statistic: [ :location, :stat_type, :offer_id ])
    end
end
