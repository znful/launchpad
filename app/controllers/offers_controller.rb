class OffersController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_offer, only: %i[ show edit update destroy ]

  # GET /offers or /offers.json
  def index
    @q = Offer.ransack(params[:q])
    @pagy, @offers = pagy(@q.result(distinct: true).order(created_at: :desc), limit: 10)
    @offer = Offer.new

    if params.dig(:q, :location).present? && params.dig(:q, :distance).present?
      location = params[:q][:location]
      distance = params[:q][:distance].to_f

      @offers = @offers.near(location, distance, units: :km)
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
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
    @offer.user_id = Current.user.id

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offers_path, notice: "Offer was successfully created." }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @offer.errors, status: :unprocessable_content }
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
      params.expect(offer: [ :company_name, :title, :description, :address, :application_link, :contract_type, :job_type, :verification_status, :status, :user_id ])
    end
end
