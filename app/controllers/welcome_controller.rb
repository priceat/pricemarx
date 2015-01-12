class WelcomeController < ApplicationController
  skip_before_action :authenticate!

  def index
    @tags = ActsAsTaggableOn::Tag.all
    @pricemarks = Pricemark.all
  end

  def about
  end
end
