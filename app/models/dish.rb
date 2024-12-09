class Dish < ApplicationRecord
  belongs_to :foodtruck

  validates :title, presence: true
  validates :price, presence: true
end
