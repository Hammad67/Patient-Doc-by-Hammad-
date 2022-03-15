class Visit < ApplicationRecord
  belongs_to :appointment ,optional: true
  has_many :prescriptions, dependent: :destroy
end
