Rails.application.routes.draw do
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]
  namespace 'api' do
    namespace 'v1' do
      get 'user', to: 'users#show'
      patch 'user', to: 'users#update'
      delete 'user', to: 'users#destroy'
      resources :authentications, only: [:destroy]
      resources :companies, :works, only: [:index, :create, :update, :destroy]
      resources :exchange_rates, only: [:index]
    end
  end
end
