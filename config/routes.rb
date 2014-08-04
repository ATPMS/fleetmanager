Rails.application.routes.draw do
  devise_for :users

  root to: "pages#index"

  namespace :users do
    resources :vessels
    get "/map", to: "vessels#map", as: :map
  end

  namespace :api do
    get "/vessels/last_location", to: "vessels#last_location", as: :last_location
    post "/vessels/logs/save", to: "vessels#save_logs", as: :save_logs
  end
end
