class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]
  before_action :set_filters, only: %i[ index ]

  # GET /offers or /offers.json
  def index
    @pagy, @offers = pagy(Offer.near(@location, @range, units: @unit).order(@sort), limit: @limit)
  end

  # GET /offers/1 or /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers or /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: "Offer was successfully created." }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1 or /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: "Offer was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer.destroy!

    respond_to do |format|
      format.html { redirect_to offers_path, notice: "Offer was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.expect(offer: [ :title, :description, :city, :country ])
    end

    def set_filters
      @limit = params[:limit] || 10
      @sort = params[:sort] || "created_at desc"
      @location = params[:location]
      @range = params[:range] || 100
      @unit = params[:unit] || "km"

      if @location.blank?
        if request.location.city.present? && not request.location.city.blank?
          @location = request.location.city + ", " + request.location.country
        else
          @location = "Paris, France"
        end
      end

      puts "Location: #{@location}"
    end
end
