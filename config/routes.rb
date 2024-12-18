Rails.application.routes.draw do
  # Routes pour la géolocalisation avec format JSON explicite
  # patch '/users/update_location', to: 'users#update_location', defaults: { format: :json }
  # patch '/guest/update_location', to: 'foodtrucks#update_guest_location', defaults: { format: :json }
  # patch '/foodtrucks/:id/update_location', to: 'foodtrucks#update_location', defaults: { format: :json }

  devise_for :users

  root to: "pages#home"

  resources :foodtrucks do
    member do
      patch :available_status
      patch :unavailable_status
    end
    resources :dishes, only: [:index, :new, :create, :edit, :update]
    resources :favorites, only: [:create, :destroy]
    resources :reviews, only: [:new, :create]
    end

  resources :favorites, only: [:index]


  resources :dishes

  get 'dashboard', to: 'pages#dashboard'

end
