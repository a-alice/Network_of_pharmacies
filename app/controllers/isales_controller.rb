class IsalesController < ApplicationController
  before_action :set_isale, only: [:show, :edit, :update, :destroy]


  def stats
    @info = Isale.stat()
  end


  # GET /isales
  # GET /isales.json
  def index
    @isales = Isale.all
  end



  # GET /isales/1
  # GET /isales/1.json
  def show
  end

  # GET /isales/new
  def new
    @isale = Isale.new
  end

  # GET /isales/1/edit
  def edit
  end

  # POST /isales
  # POST /isales.json
  def create
    @isale = Isale.new(isale_params)
    respond_to do |format|
      if @isale.save
        if Statistic.find_by(number: @isale.pharmacy_id).blank? == false
          stat = Statistic.find_by(number: @isale.pharmacy_id)
          stat.update_attributes(quantity: stat.quantity + @isale.quantity)
        else            
          stat = Statistic.create(number: @isale.pharmacy_id, quantity: @isale.quantity)
        end
        format.html { redirect_to @isale, notice: t('helpers.success-crt') }
        format.json { render :show, status: :created, location: @isale }
      else
        format.html { render :new }
        format.json { render json: @isale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /isales/1
  # PATCH/PUT /isales/1.json
  def update
    old_quantity = @isale.quantity # Старое значение

    respond_to do |format|
      if @isale.update(isale_params)
        stat = Statistic.find_by(number: @isale.pharmacy_id)

        stat.update_attributes(quantity: stat.quantity - old_quantity + @isale.quantity)
        
        format.html { redirect_to @isale, notice: t('helpers.success-upd') }
        format.json { render :show, status: :ok, location: @isale }
      else
        format.html { render :edit }
        format.json { render json: @isale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /isales/1
  # DELETE /isales/1.json
  def destroy
    stat = Statistic.find_by(number:@isale.pharmacy_id)
    if stat.quantity == @isale.quantity
      stat.destroy
    else
      stat.update_attributes(quantity: stat.quantity - @isale.quantity)
    end

    @isale.destroy
    respond_to do |format|
      format.html { redirect_to isales_url, notice: 'Isale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_isale
      @isale = Isale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def isale_params
      params.require(:isale).permit(:pharmacy_id, :provisor_id, :drug_id, :date_sale, :quantity)
    end


end
