class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :booking_date, presence: true
  enum :status, pending: 0, accept: 1, refuse: 2
end
