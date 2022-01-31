ActiveAdmin.register Doctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :type, :first_name, :last_name, :phone_number, :address, :city, :dateofbirth, :email,:password
  #
  # or
  #
  # permit_params do
  #   permitted = [:type, :first_name, :last_name, :Email, :phone_number, :address, :city, :dateofbirth, :password]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :phone_number
      f.input :address
      f.input :dateofbirth,:start_year=>1990

    end
    f.actions
  end


end
