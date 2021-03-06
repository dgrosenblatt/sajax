Rails.application.routes.draw do
  devise_for :users
  namespace :api, path: '/', constraints: { subdomain: 'api'} do
    namespace :v1 do
      resources :puzzles, only: [:index, :show, :create, :update, :destroy]
      resources :games, only: [:create, :update]
    end
  end
end
