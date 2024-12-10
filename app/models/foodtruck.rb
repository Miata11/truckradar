class Foodtruck < ApplicationRecord
  belongs_to :user

  has_many :dishes
  has_many :reviews
  has_many :favorites

  validates :name, presence: true
  validates :category, presence: true
  validates :address_default, presence: true
end
