class ProvisorsController < ApplicationController
  before_action :set_provisor, only: [:show, :edit, :update, :destroy]

  # GET /provisors
  # GET /provisors.json
  def index
    @provisors = Provisor.all
  end

  # GET /provisors/1
  # GET /provisors/1.json
  def show
  end

  # GET /provisors/new
  def new
    @provisor = Provisor.new
  end

  # GET /provisors/1/edit
  def edit
  end

  # POST /provisors
  # POST /provisors.json
  def create
    @provisor = Provisor.new(provisor_params)

    respond_to do |format|
      if @provisor.save
        format.html { redirect_to @provisor, notice: t('helpers.success-crt') }
        format.json { render :show, status: :created, location: @provisor }
      else
        format.html { render :new }
        format.json { render json: @provisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provisors/1
  # PATCH/PUT /provisors/1.json
  def update
    respond_to do |format|
      if @provisor.update(provisor_params)
        format.html { redirect_to @provisor, notice: t('helpers.success-upd') }
        format.json { render :show, status: :ok, location: @provisor }
      else
        format.html { render :edit }
        format.json { render json: @provisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provisors/1
  # DELETE /provisors/1.json
  def destroy
    @provisor.destroy
    respond_to do |format|
      format.html { redirect_to provisors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provisor
      @provisor = Provisor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provisor_params
      params.require(:provisor).permit(:name, :surname, :fathername, :birthday, :inn, :passport, :pharmacy_id)
    end
end
