Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "static_pages/help"
  match "/help", to: "static_pages#help", via: "get"
  match "/status", to: "static_pages#status", via: "get"

  # Defines the root path route ("/")
  root to: redirect("/items")
  resources :items do
    resources :minutes
    resources :requests do
      # There's an option to display a request 'pre'-formatted.
      get "pre", on: :member
    end
  end

  # The list of meetings.  Each meeting displays the maintenance items which were progressed at it.
  resources :meetings do
    resources :motions
  end
  resources :products
end
