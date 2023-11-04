Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: redirect("/now")

  get "/now", to: "periods#index", as: :now, period: "now"
  get "/:period/:chart", to: "periods#index", as: :periods, constraints: Solaris::Constraints
  get "/charts/:chart/:period", to: "charts#show", as: :chart, constraints: Solaris::Constraints
  get "/indicators/:indicator/:period", to: "indicators#show", as: :indicator, constraints: Solaris::Constraints
end
