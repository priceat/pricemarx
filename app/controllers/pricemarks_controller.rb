class PricemarksController < ApplicationController
  before_action :set_pricemark, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:create, :edit, :update]

  require 'embedly'
  require 'json'

  def index
    @pricemarks = Pricemark.all
    @tags = Pricemark.all.tag_counts
  end

  def my_index
    if logged_in?
      @pricemarks = current_user.pricemarks.all
      @user_tags = @pricemarks.tag_counts
      favorites = Favorite.where(user_id: current_user)
      favorite_pricemarks = Pricemark.where(id: favorites.pluck(:pricemark_id))
      @favorite_tags = favorite_pricemarks.tag_counts
      render pricemarks_my_index_path
    else 
      flash[:error] = "You have to be logged in, cat!"
      redirect_to login_path
    end
  end

  def show
    @url = embedly_api.oembed(:url => @pricemark.url).first
  end

  def new
    @pricemark = current_user.pricemarks.new
  end

  def create
    @pricemark = current_user.pricemarks.new(pricemark_params)
      respond_to do |format|
      if @pricemark.save
        format.html { redirect_to pricemarks_my_index_path, notice: 'Pricemark was successfully stored.' }
        format.json { render action: 'show', status: :created, location: @pricemark }
      else
        format.html { render action: 'new' }
        format.json { render json: @pricemark.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @pricemark.update(pricemark_params)
        format.html { redirect_to @pricemark, notice: 'Pricemark was successfully updated.' }
        format.json { render :show, status: :ok, location: @pricemark }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pricemark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @pricemark.destroy
      flash[:error] = "Pricemark purged!"
      redirect_to pricemarks_my_index_path
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end
  end

  private
  
  def set_pricemark
    @pricemark = Pricemark.find(params[:id])
  end

  def pricemark_params
    params.require(:pricemark).permit(:url, :tag_list, :title)
  end

  def embedly_api
    Embedly::API.new :key => ENV['EMBEDLY_KEY']
  end

end
