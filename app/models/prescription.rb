class Prescription < ApplicationRecord
  validates_presence_of :dose_name, :dosage_frequency, :dose_detail
  belongs_to :visit
end
