class Doctors::SessionsController < Devise::SessionsController

  def destroy
    reset_session
  end
end
