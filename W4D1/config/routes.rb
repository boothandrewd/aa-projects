Rails.application.routes.draw do
  resources :users, only: [:index, :update, :create, :destroy, :show] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :artworks, only: [:index, :update, :create, :destroy, :show] do
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only: [:index, :create, :destroy]
  resources :comments, only: [:create,:destroy,:index]

end
