class Doctor < User
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  validates :phone_number, uniqueness: true, length: { is: 11 }
  devise :database_authenticatable, :validatable
end
