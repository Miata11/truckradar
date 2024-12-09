class Review < ApplicationRecord
  belongs_to :user
  belongs_to :foodtruck

  validates :rating, presence: true
end
