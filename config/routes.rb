Rails.application.routes.draw do
  devise_for :gyms, path: 'gyms', controllers: { sessions: "gyms/sessions"}
  devise_for :athletes, path: 'athletes', controllers: { sessions: "athletes/sessions"}
  
  resources :worksheets
  resources :courses
  resources :coupons

  root 'home#index'
  get '/guest', to: 'home#guest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
