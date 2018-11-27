class Picture < ApplicationRecord
  belongs_to :flat
  # validates :url, presence: true, allow_nil: false, allow_blank: false
  # validates :is_primary, presence: true, inclusion: { in: [true, false] }, allow_nil: false, allow_blank: false

  mount_uploader :url, PhotoUploader
end
