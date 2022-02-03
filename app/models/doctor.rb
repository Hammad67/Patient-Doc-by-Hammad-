class Doctor < User
  validates :phone_number, uniqueness: true, length: { in: 11..11 }
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
