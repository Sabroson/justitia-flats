class Flat < ApplicationRecord
  class CoordsError < StandardError; end
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, length: { minimum: 6, too_short: "%{count} characters is the minimum allowed" }, allow_blank: false
  validates :name, presence: true, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
  validates :address, presence: true, allow_blank: false
  validates :description, presence: true, length: { maximum: 200, too_long: "%{count} characters is the maximum allowed" }
  validates :price_per_night, presence: true, allow_nil: false, numericality: { only_integer: true, greater_than: 0 }
  validates :number_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0 }, allow_nil: false

  geocoded_by :address

  before_save :validate_coords

  # to be used when saving flats from the command line instead of save
  def geo_save
    geocode
    save
  end

  def validate_coords
    raise CoordsError if latitude.nil? || longitude.nil?
  end

  def primary_picture_url
    pic = pictures.where(is_primary: true).first
    pic.nil? ? false : pic.url
  end

end
