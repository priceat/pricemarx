class WelcomeController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    @pricemarks = Pricemark.all
  end

  def about
  end
end
