class User < ApplicationRecord
  geocoded_by :address_default
  after_validation :geocode, if: ->(obj) {
    obj.latitude.blank? && obj.longitude.blank? &&
    obj.address_default.present? &&
    obj.will_save_change_to_address_default?
  }
  after_save_commit :broadcast_map, if: -> { saved_change_to_real_time_tracking? && role }
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_one :foodtruck
  has_one_attached :photo

  has_many :reviews, dependent: :destroy


  # validates :siret, format: { with: /\A\d{14}\z/, message: "Le SIRET doit contenir exactement 14 chiffres" }
  # validates :company_name, presence: true, if: -> { role }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  private

  def broadcast_map
    broadcast_replace_to "display_map",
                        partial: "foodtrucks/reload",
                        target: "reload"
  end
end
