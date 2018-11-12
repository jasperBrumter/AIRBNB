class Picture < ApplicationRecord
  belongs_to :boat
  belongs_to :user
end
