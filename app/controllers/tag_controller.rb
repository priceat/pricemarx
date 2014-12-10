class TagController < ApplicationController

def show
    @tag = Tag.find(params[:id])
    @pricemarks = Pricemark.tagged_with(@tag.name)
  end
end
