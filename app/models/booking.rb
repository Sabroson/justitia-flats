class Booking < ApplicationRecord
  BOOKING_STATUSES = ["pending", "approved", "rejected"]

  belongs_to :user
  belongs_to :flat

  validates :status, presence: true, inclusion: { in: BOOKING_STATUSES }

def primary_picture
  primary = flat.pictures.where(is_primary: true).first
  primary.nil? ? false : primary.url
end
end
