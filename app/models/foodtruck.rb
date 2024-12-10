class Foodtruck < ApplicationRecord
  geocoded_by :address_default
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode, if: ->(obj) {
    obj.latitude.blank? && obj.longitude.blank? &&
    obj.address_default.present? &&
    obj.will_save_change_to_address_default?
  }

  after_validation :reverse_geocode, if: ->(obj) {
    obj.latitude.present? && obj.longitude.present? &&
    (obj.will_save_change_to_latitude? || obj.will_save_change_to_longitude?)
  }

  belongs_to :user

  has_many :dishes
  has_many :reviews
  has_many :favorites

  validates :name, presence: true
  validates :category, presence: true
  validates :address_default, presence: true


  include PgSearch::Model
  # multisearchable against: [:name, :category, :address_default]
  pg_search_scope :search_by_foodtrucks,
  against: [:name, :category, :address_default],
  using: {
    tsearch:{prefix:true}
  }
end
