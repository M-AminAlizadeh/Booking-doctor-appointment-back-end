class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  # validations
  validates :date_of_appointment, presence: true

  delegate :name, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :doctor, prefix: true, allow_nil: true
end
