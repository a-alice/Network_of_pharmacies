class IavailsController < ApplicationController
  before_action :set_iavail, only: [:show, :edit, :update, :destroy]

  # GET /iavails
  # GET /iavails.json
  def index
    @iavails = Iavail.all
  end

  # GET /iavails/1
  # GET /iavails/1.json
  def show
  end

  # GET /iavails/new
  def new
    @iavail = Iavail.new
  end

  # GET /iavails/1/edit
  def edit
  end

  # POST /iavails
  # POST /iavails.json
  def create
    @iavail = Iavail.new(iavail_params)

    respond_to do |format|
      if @iavail.save
        format.html { redirect_to @iavail, notice: t('helpers.success-crt') }
        format.json { render :show, status: :created, location: @iavail }
      else
        format.html { render :new }
        format.json { render json: @iavail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iavails/1
  # PATCH/PUT /iavails/1.json
  def update
    respond_to do |format|
      if @iavail.update(iavail_params)
        format.html { redirect_to @iavail, notice: t('helpers.success-upd') }
        format.json { render :show, status: :ok, location: @iavail }
      else
        format.html { render :edit }
        format.json { render json: @iavail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iavails/1
  # DELETE /iavails/1.json
  def destroy
    @iavail.destroy
    respond_to do |format|
      format.html { redirect_to iavails_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iavail
      @iavail = Iavail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iavail_params
      params.require(:iavail).permit(:drug_id, :pharmacy_id, :quantity)
    end
end
