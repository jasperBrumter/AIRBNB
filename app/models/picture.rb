class Picture < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
