Rails.application.routes.draw do
  mount GoodJob::Engine => "good_job"

  get "up" => "rails/health#show", :as => :rails_health_check

  get "/signin", to: "sessions#new", as: :login
  delete "/logout", to: "sessions#destroy", as: :logout

  get "/profile", to: "patient_profiles#show", as: :profile

  resources :appointments
  resource :dashboards, only: [:show]
  resources :sessions, only: [:create, :destroy, :new]

  root "dashboards#show"
end
