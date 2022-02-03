class Doctor < User
  validates :phone_number, uniqueness: true, length: { minimum: 11,maximum: 11 }
  devise :database_authenticatable ,:validatable
end
