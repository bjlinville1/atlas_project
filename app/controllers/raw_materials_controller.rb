class RawMaterialsController < ApplicationController
  before_action :set_raw_material, only: [:show, :edit, :update, :destroy]

  # GET /raw_materials
  # GET /raw_materials.json
  def index
    @raw_materials = RawMaterial.all
  end

  # GET /raw_materials/1
  # GET /raw_materials/1.json
  def show
  end

  # GET /raw_materials/new
  def new
    @raw_material = RawMaterial.new
  end

  # GET /raw_materials/1/edit
  def edit
  end

  # POST /raw_materials
  # POST /raw_materials.json
  def create
    @raw_material = RawMaterial.new(raw_material_params)

    respond_to do |format|
      if @raw_material.save
        format.html { redirect_to @raw_material, notice: 'Raw material was successfully created.' }
        format.json { render :show, status: :created, location: @raw_material }
      else
        format.html { render :new }
        format.json { render json: @raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_materials/1
  # PATCH/PUT /raw_materials/1.json
  def update
    respond_to do |format|
      if @raw_material.update(raw_material_params)
        format.html { redirect_to @raw_material, notice: 'Raw material was successfully updated.' }
        format.json { render :show, status: :ok, location: @raw_material }
      else
        format.html { render :edit }
        format.json { render json: @raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_materials/1
  # DELETE /raw_materials/1.json
  def destroy
    @raw_material.destroy
    respond_to do |format|
      format.html { redirect_to raw_materials_url, notice: 'Raw material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_material
      @raw_material = RawMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_material_params
      params.require(:raw_material).permit(
      :name,
      :region_id,
      quantity_attributes: [
        :id,        
        :quantity, 
        :building_id, 
        :a5_id, 
        :a4_id, 
        :a3_id, 
        :a2_id, 
        :assembly_id, 
        :part_id, 
        :raw_material_id, 
        :milestone_id, 
        :labor_id, 
        :credit_id, 
        :debt_id, 
        :inventory_id, 
        :participant_id]
      )#, :_destroy])
    end
end
