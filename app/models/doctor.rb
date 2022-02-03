class Doctor < User
  validates :phone_number, uniqueness: true, length: { is: 11 }
  devise :database_authenticatable, :validatable
end
