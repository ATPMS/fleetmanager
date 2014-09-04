Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root to: "pages#index"

  resources :vessels do
    resources :crews, controller: "vessels/crews"
    resources :vessel_maintenances, controller: "vessels/vessel_maintenances"
  end

  resources :vessel_maintenances

  get "/vessels/:id/real_time", to: "vessels#real_time", as: :vessel_real_time
  get "/vessels/:id/tracking_history", to: "vessels#tracking_history", as: :vessel_tracking_history
  get "/map", to: "vessels#map", as: :map
  post "/map", to: "vessels#map", as: :map_post

  namespace :account do
    resources :users, only: [:show, :edit, :update]
  end

  resources :service_companies

  namespace :api do
    get "/vessels/last_location", to: "vessels#last_location", as: :last_location
    post "/vessels/last_locations", to: "vessels#last_locations", as: :last_locations
    post "/vessels/logs/save", to: "vessels#save_logs", as: :save_logs
    get "/vessels/get_logs", to: "vessels#get_logs", as: :get_logs
  end

  get "/traffic", to: "pages#traffic_volume", as: :traffic_volume
  get "/get_traffic_volume", to: "pages#get_traffic_volume", as: :get_traffic_volume
end
