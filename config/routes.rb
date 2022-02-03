Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors,controllers:{sessions: 'doctors/sessions'}
  resources :patients
  root to: "homes#index"


end
