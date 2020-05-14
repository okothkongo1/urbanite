Rails.application.routes.draw do
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  authenticate :user do
    resources :advertisements
  end
  resources :users, only: %i[index]
end
