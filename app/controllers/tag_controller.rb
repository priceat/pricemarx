class TagController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @pricemarks = Pricemark.tagged_with(@tag.name)
    #flash error
  end

  def favorite_tags
    @tag = Tag.find(params[:id])
    favorites = Favorite.where(user_id: current_user)
    @pricemarks = Pricemark.where(id: favorites.pluck(:pricemark_id))
  end

  def user_tags
    @tag = Tag.find(params[:id])
    @pricemarks = current_user.pricemarks.tagged_with(@tag.name)
  end
end
