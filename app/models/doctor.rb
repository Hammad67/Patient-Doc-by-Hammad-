class Doctor < User
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  validates :phone_number, uniqueness: true, length: { is: 13 }
  devise :database_authenticatable, :validatable

end
