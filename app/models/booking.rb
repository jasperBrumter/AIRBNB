class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  validates :checkin, presence: true
  validates :checkout, presence: true
  validates :user, presence: true
  validates :boat, presence: true
end
