Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      # match '*path' => 'options_request#cors_preflight_check', via: :options
      get 'user', to: 'users#show'
      patch 'user', to: 'users#update'
      delete 'user', to: 'users#destroy'
      resources :authentications, only: [:destroy]
      resources :companies, :works, only: [:index, :create, :update, :destroy]
      resources :exchange_rates, only: [:index]
    end
  end
end
