class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy]

  # GET /drugs
  # GET /drugs.json
  def index
    @drugs = Drug.all
  end

  # GET /drugs/1
  # GET /drugs/1.json
  def show
  end

  # GET /drugs/new
  def new
    @drug = Drug.new
  end

  # GET /drugs/1/edit
  def edit
  end

  # POST /drugs
  # POST /drugs.json
  def create
    @drug = Drug.new(drug_params)

    respond_to do |format|
      if @drug.save
        c = Category.find_by(id:@drug.new_category)
        if c.blank? == false && @drug.categories.include?(c) == false
                @drug.categories << c
        end

        format.html { redirect_to @drug, notice: t('helpers.success-crt') }
        format.json { render :show, status: :created, location: @drug }
      else
        format.html { render :new }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drugs/1
  # PATCH/PUT /drugs/1.json
  def update
    respond_to do |format|
      if @drug.update(drug_params)

        c1 = Category.find_by(id:@drug.new_category)
        if c1.blank? == false && @drug.categories.include?(c1) == false
          @drug.categories << c1
        end

        c2 = Category.find_by(id:@drug.dest_category)
        if @drug.categories.include?(c2) == true
          @drug.categories.delete(c2)
        end
                
        format.html { redirect_to @drug, notice: t('helpers.success-upd') }
        format.json { render :show, status: :ok, location: @drug }
      else
        format.html { render :edit }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    @drug.destroy
    respond_to do |format|
      format.html { redirect_to drugs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug
      @drug = Drug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_params
      params.require(:drug).permit(:name, :volume, :dosage, :maker, :recipe, :new_category, :dest_category)
    end
end
