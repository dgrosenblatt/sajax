Rails.application.routes.draw do
  namespace :api, path: '/', constraints: { subdomain: 'api'} do
    resources :puzzles, only: [:index, :show, :create, :update]
  end
end
