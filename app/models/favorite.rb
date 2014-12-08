class Favorite < ActiveRecord::Base
  belongs_to :pricemark
  belongs_to :user
end
