class Appointment < ApplicationRecord
  validates :date, presence: true
  belongs_to :doctor, :class_name => "User"
  belongs_to :patient, :class_name => "User"
  has_one :visit, dependent: :destroy
end
