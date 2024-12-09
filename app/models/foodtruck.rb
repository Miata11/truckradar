class Foodtruck < ApplicationRecord
  belongs_to :user

  has_many :dishes, :reviews, :favorites

  validates :name, presence: true
  validates :category, presence: true
  validates :address_default, presence: true
end
