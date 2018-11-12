class User < ApplicationRecord
  has_many :boats, dependent: :destroy
  has_many :bookings
  has_many :pictures, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def rented_boats
    bookings.pluck[:boat]
  end
end
