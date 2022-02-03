Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors,only: [:registrations,:sessions]
  root to: "homes#index"


end
