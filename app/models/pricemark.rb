class Pricemark < ActiveRecord::Base
  validates :url, presence: true, length: { minimum: 1 }
  validates :user, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  acts_as_taggable
  default_scope { order('created_at DESC') }

  @tags = Pricemark.tag_counts_on(:tags)
  
end
