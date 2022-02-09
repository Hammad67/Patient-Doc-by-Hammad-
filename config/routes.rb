Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors, controllers: { sessions: 'doctors/sessions' }
  resources :patients do
    resources :appointments do
      resources :visits
    end
  end
  root to: "homes#index"
end
