Rails.application.routes.draw do
  resources :worksheets
  resources :courses
  resources :coupons
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
