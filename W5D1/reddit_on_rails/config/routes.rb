Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy]
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create, :destroy]
end
