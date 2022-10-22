Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resource :user, only: [:show, :update, :destroy]
      resources :accounts, only: [:destroy]
      resources :companies, :works, only: [:index, :create, :update, :destroy]
      resources :exchange_rates, only: [:index, :create]
    end
  end
end
