class TagController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @pricemarks = Pricemark.tagged_with(@tag.name).paginate(page: params[:page], per_page: 10)
  end

  def favorite_tags
    @tag = Tag.find(params[:id])
    favorites = Favorite.where(user_id: current_user)
    @pricemarks = Pricemark.tagged_with(@tag.name).where(id: favorites.pluck(:pricemark_id)).paginate(page: params[:page], per_page: 10)
  end

  def user_tags
    @tag = Tag.find(params[:id])
    @pricemarks = current_user.pricemarks.tagged_with(@tag.name).paginate(page: params[:page], per_page: 10)
  end
end
