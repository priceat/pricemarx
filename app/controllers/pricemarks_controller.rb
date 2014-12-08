class PricemarksController < ApplicationController
  before_action :set_pricemark, only: [:show, :edit, :update, :destroy]

  def index
    @pricemarks = current_user.pricemarks
  end

  def show
  end

  def new
    @pricemark = current_user.pricemarks.new
  end

  def create
    @pricemark = current_user.pricemarks.new(pricemark_params)
      respond_to do |format|
      if @pricemark.save
        format.html { redirect_to @pricemark, notice: 'Pricemark was successfully stored.' }
        format.json { render action: 'show', status: :created, location: @pricemark }
      else
        format.html { render action: 'new' }
        format.json { render json: @pricemark.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pricemark.update(pricemark_params)
        format.html { redirect_to @pricemark, notice: 'Pricemark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pricemark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pricemark.destroy
    respond_to do |format|
      format.html { redirect_to pricemarks_url }
      format.json { head :no_content }
    end
  end

  private
  
  def set_pricemark
    @pricemark = Pricemark.find(params[:id])
  end

  def pricemark_params
      params.require(:pricemark).permit(:url, :user_id, :topics[])
  end

end
