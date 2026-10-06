class ScamsController < ApplicationController
  before_action :set_scam, only: %i[ show edit update destroy ]

  # GET /scams or /scams.json
  def index
    @scams = Scam.all
  end

  # GET /scams/1 or /scams/1.json
  def show
  end

  # GET /scams/new
  def new
    @scam = Scam.new
  end

  # GET /scams/1/edit
  def edit
  end

  # POST /scams or /scams.json
  def create
    @scam = Scam.new(scam_params)

    respond_to do |format|
      if @scam.save
        format.html { redirect_to @scam, notice: "Scam was successfully created." }
        format.json { render :show, status: :created, location: @scam }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @scam.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /scams/1 or /scams/1.json
  def update
    respond_to do |format|
      if @scam.update(scam_params)
        format.html { redirect_to @scam, notice: "Scam was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @scam }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @scam.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /scams/1 or /scams/1.json
  def destroy
    @scam.destroy!

    respond_to do |format|
      format.html { redirect_to scams_path, notice: "Scam was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scam
      @scam = Scam.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def scam_params
      params.expect(scam: [ :post_id, :scammer_type, :person_name, :dateofbirth, :email, :phone, :current_place, :moreinfo, :scammerdescription ])
    end
end
