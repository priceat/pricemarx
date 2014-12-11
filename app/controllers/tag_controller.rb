class TagController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @pricemarks = Pricemark.tagged_with(@tag.name)
  end

  def edit
    @tag = Tag.find(params[:id])
    favorites = Favorite.where(user_id: current_user)
    @pricemarks = Pricemark.where(id: favorites.pluck(:pricemark_id))
  end

end
