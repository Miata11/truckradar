class Dish < ApplicationRecord
  belongs_to :foodtruck
  has_one_attached :photo

  validates :title, presence: true
  validates :price, presence: true
end
