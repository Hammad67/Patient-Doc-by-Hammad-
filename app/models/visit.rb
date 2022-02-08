class Visit < ApplicationRecord
  belongs_to :appointment
  has_many :prescriptions, dependent: :destroy
end
