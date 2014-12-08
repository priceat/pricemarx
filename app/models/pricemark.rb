class Pricemark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  validates :url, presence: true, length: { minimum: 1 }
  validates :user, presence: true
end
