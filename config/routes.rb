Rails.application.routes.draw do
  # Routes pour la géolocalisation avec format JSON explicite
  patch '/users/update_location', to: 'users#update_location', defaults: { format: :json }
  patch '/guest/update_location', to: 'foodtrucks#update_guest_location', defaults: { format: :json }
  patch '/foodtrucks/:id/update_location', to: 'foodtrucks#update_location', defaults: { format: :json }

  devise_for :users

  root to: "pages#home"

  resources :foodtrucks do
    resources :dishes, only: [:new, :create]
    resources :favorites, only: [:new, :create, :destroy]
  end

  get 'dashboard', to: 'pages#dashboard'
  resources :dishes
end
