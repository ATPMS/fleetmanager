Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root to: "pages#index"

  namespace :account do
    resources :vessels
    get "/vessels/:id/real_time", to: "vessels#real_time", as: :vessel_real_time
    get "/vessels/:id/tracking_history", to: "vessels#tracking_history", as: :vessel_tracking_history
    resources :vessel_maintenances
    resources :users, only: [:show, :edit, :update]
    get "/map", to: "vessels#map", as: :map
  end

  namespace :api do
    get "/vessels/last_location", to: "vessels#last_location", as: :last_location
    post "/vessels/logs/save", to: "vessels#save_logs", as: :save_logs
    get "/vessels/get_logs", to: "vessels#get_logs", as: :get_logs
  end
end
