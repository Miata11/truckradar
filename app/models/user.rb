class User < ApplicationRecord
  geocoded_by :address_default
  after_validation :geocode, if: ->(obj) {
    obj.latitude.blank? && obj.longitude.blank? &&
    obj.address_default.present? &&
    obj.will_save_change_to_address_default?
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_one :foodtruck

  # has_many :reviews,


  # validates :siret, presence: true, if: role?
  # validates :company_name, presence: true, if: -> { role }
  validates :first_name, presence: true
  validates :last_name, presence: true


end
