Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  authenticate :user do
    resources :advertisements
  end

  namespace :admin do
      resources :users
      resources :advertisements

      root to: "users#index"
  end
  root 'home#index'
end
