class Patient < User
  validates_presence_of :first_name, :last_name, :email, :phone_number
  validates :phone_number, uniqueness: true
  validates_length_of :first_name, :last_name, :phone_number, length: { is: 11 }
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, uniqueness: true

  def self.columns
    super.reject { |column| column.name == 'encrypted_password' }
  end
end
