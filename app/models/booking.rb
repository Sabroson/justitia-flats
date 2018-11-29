class Booking < ApplicationRecord
  BOOKING_STATUSES = ["pending", "approved", "rejected"]

  belongs_to :user
  belongs_to :flat

  validates :status, presence: true, inclusion: { in: BOOKING_STATUSES }
end
