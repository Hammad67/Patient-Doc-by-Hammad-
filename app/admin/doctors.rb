ActiveAdmin.register Doctor do
  permit_params :type, :first_name, :last_name, :phone_number, :address, :city, :date_of_birth, :email, :password
  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :phone_number
      f.input :address
      f.input :date_of_birth, :start_year => 1990
    end
    f.actions
  end
end
