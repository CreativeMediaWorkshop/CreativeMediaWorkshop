class MoItemsController < ApplicationController
  before_action :set_mo_item, only: [:show, :edit, :update, :destroy]

  # GET /mo_items
  # GET /mo_items.json
  def index
    @mo_items = MoItem.all
  end

  # GET /mo_items/1
  # GET /mo_items/1.json
  def show
  end

  # GET /mo_items/new
  def new
    @mo_item = MoItem.new
  end

  # GET /mo_items/1/edit
  def edit
  end

  # POST /mo_items
  # POST /mo_items.json
  def create
    @mo_item = MoItem.new(mo_item_params)

    respond_to do |format|
      if @mo_item.save
        format.html { redirect_to @mo_item, notice: 'Mo item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mo_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @mo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mo_items/1
  # PATCH/PUT /mo_items/1.json
  def update
    respond_to do |format|
      if @mo_item.update(mo_item_params)
        format.html { redirect_to @mo_item, notice: 'Mo item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mo_items/1
  # DELETE /mo_items/1.json
  def destroy
    @mo_item.destroy
    respond_to do |format|
      format.html { redirect_to mo_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mo_item
      @mo_item = MoItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mo_item_params
      params.require(:mo_item).permit(:title, :subtitle, :price, :file, :author, :description, :type, :click_times)
    end
end
