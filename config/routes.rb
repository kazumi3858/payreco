Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:index, :create, :update, :destroy]
      resources :companies, only: [:index, :create, :update, :destroy]
      resources :works, only: [:index, :create, :update, :destroy]
    end
  end
end
