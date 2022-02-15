Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors, controllers: { sessions: 'doctors/sessions' }
  resources :patients do
    resources :medical_records
    resources :appointments do
      resources :visits do
        resources :prescriptions
      end
    end
  end
  root to: "homes#index"
end
