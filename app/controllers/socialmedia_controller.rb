class SocialmediaController < ApplicationController
  before_action :set_socialmedia, only: %i[ show edit update destroy ]

  # GET /socialmedia or /socialmedia.json
  def index
    @socialmedia = Socialmedia.all
  end

  # GET /socialmedia/1 or /socialmedia/1.json
  def show
  end

  # GET /socialmedia/new
  def new
    @socialmedia = Socialmedia.new
  end

  # GET /socialmedia/1/edit
  def edit
  end

  # POST /socialmedia or /socialmedia.json
  def create
    @socialmedia = Socialmedia.new(socialmedia_params)

    respond_to do |format|
      if @socialmedia.save
        format.html { redirect_to @socialmedia, notice: "Socialmedia was successfully created." }
        format.json { render :show, status: :created, location: @socialmedia }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @socialmedia.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /socialmedia/1 or /socialmedia/1.json
  def update
    respond_to do |format|
      if @socialmedia.update(socialmedia_params)
        format.html { redirect_to @socialmedia, notice: "Socialmedia was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @socialmedia }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @socialmedia.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /socialmedia/1 or /socialmedia/1.json
  def destroy
    @socialmedia.destroy!

    respond_to do |format|
      format.html { redirect_to socialmedia_index_path, notice: "Socialmedia was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socialmedia
      @socialmedia = Socialmedia.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def socialmedia_params
      params.expect(socialmedia: [ :name ])
    end
end
