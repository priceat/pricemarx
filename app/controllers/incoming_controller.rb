class IncomingController < ApplicationController
before_filter :set_headers
skip_before_filter :verify_authenticity_token
respond_to :json


  def create
    @user = User.find_by_email(params[:sender])
    @pricemark = @user.pricemarks.build(url: params[:'body-plain'],tag_list: params[:'subject'].scan(/#\S+/))
    @pricemark.save
    render json: { message: "It worked!" }, status: 200
  end

  private


  def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
      headers['Access-Control-Max-Age'] = '1728000'
  end

end