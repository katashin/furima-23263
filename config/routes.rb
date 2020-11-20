Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
