Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
   resources :guests, only: [:index, :show] do
     resources :gifts, only: [:index]
   end
   resources :gifts, only: [:show]
   resources :invitations, only: [:show, :index]
   resources :parties, only: [:show, :index]
 end
end
