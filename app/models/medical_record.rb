class MedicalRecord < ApplicationRecord
  belongs_to :patient,:class_name => "User"
end
