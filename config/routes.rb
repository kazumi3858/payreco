Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:create]
      resources :companies, :works, only: [:index, :create, :update, :destroy]
    end
  end
end
