class Flat < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, length: { minimum: 6, too_short: "%{count} characters is the minimum allowed" }, allow_blank: false
  validates :name, presence: true, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
  validates :address, presence: true, allow_blank: false
  validates :description, presence: true, length: { maximum: 200, too_long: "%{count} characters is the maximum allowed" }
  validates :price_per_night, presence: true, allow_nil: false, numericality: { only_integer: true, greater_than: 0 }
  validates :number_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0 }, allow_nil: false
  # validates :latitude, presence: true, allow_blank: false
  # validates :longitude, presence: true, allow_blank: false

end
