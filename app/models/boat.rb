class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :address, presence: true
  validates :user, presence: true
  validates :price, presence: true, numericality: true
  validates :number_of_crew, presence: true, numericality: { only_integer: true }

  mount_uploader :photo1, PhotoUploader

  after_initialize :init
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def init
    self.average_rating  ||= 0.0           #will set the default value only if it's nil
  end
end
