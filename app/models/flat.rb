class Flat < ApplicationRecord
  belongs_to :user
  has_many :pictures
  has_many :bookings
  validates :name, presence: true, length: { minimum: 6, too_short: "%{count} characters is the minimum allowed" }, allow_blank: false
  validates :name, presence: true, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
  validates :address, presence: true, allow_blank: false
  validates :description, presence: true, length: { maximum: 200, too_long: "%{count} characters is the maximum allowed" }
  validates :price_per_night, presence: true, numericality: { only_integer: true }
  validates :number_of_guests, presence: true, numericality: { only_integer: true }
  validates :latitude, presence: true, allow_nil: false
  validates :longitude, presence: true, allow_nil: false
end
