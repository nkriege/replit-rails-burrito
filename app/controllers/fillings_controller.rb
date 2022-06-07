class FillingsController < ApplicationController
  before_action :set_filling, only: %i[show edit update destroy]

  # GET /fillings or /fillings.json
  def index
    @fillings = Filling.all.order(:name)
  end

  def tuples
    @fillings = Filling.where(available: true).order(:name)
  end

  # GET /fillings/1 or /fillings/1.json
  def show; end

  # GET /fillings/new
  def new
    @filling = Filling.new
  end

  # GET /fillings/1/edit
  def edit; end

  # POST /fillings or /fillings.json
  def create
    @filling = Filling.new(filling_params)

    respond_to do |format|
      if @filling.save
        format.html { redirect_to fillings_url, notice: 'Filling was successfully created.' }
        format.json { render :show, status: :created, location: @filling }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @filling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fillings/1 or /fillings/1.json
  def update
    respond_to do |format|
      if @filling.update(filling_params)
        format.html { redirect_to fillings_url, notice: 'Filling was successfully updated.' }
        format.json { render :show, status: :ok, location: @filling }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @filling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fillings/1 or /fillings/1.json
  def destroy
    @filling.destroy

    respond_to do |format|
      format.html { redirect_to fillings_url, notice: 'Filling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_filling
    @filling = Filling.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def filling_params
    params.require(:filling).permit(:name, :description, :price, :calories, :available)
  end
end
