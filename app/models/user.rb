class User < ActiveRecord::Base
   has_secure_password
   validates_uniqueness_of :email
   validates_presence_of :name
   has_many :pricemarks, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :favorite_pricemarks, :through => :favorites, :source => :pricemark

   def favorited(pricemark)
    favorites.where(pricemark_id: pricemark.id).first
   end

end
