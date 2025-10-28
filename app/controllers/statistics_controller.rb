class StatisticsController < ApplicationController
  # POST /statistics or /statistics.json
  def create
    @statistic = Statistic.new(statistic_params)

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
