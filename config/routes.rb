Rails.application.routes.draw do
  devise_for :gyms, path: 'gyms', controllers: { registrations: "gyms/registrations", sessions: "gyms/sessions"}
  devise_for :athletes, path: 'athletes', controllers: { registrations: "athletes/registrations", sessions: "athletes/sessions", omniauth_callbacks: "athletes/omniauth_callbacks"}

  resources :worksheets
  resources :courses
  resources :coupons
  resources :gyms

  root 'home#index'
  get '/guest', to: 'home#guest'

  #athlete routes
  get '/athlete/home', to: 'athlete#home'
  get '/athlete/profile', to: 'athlete#profile'
  get '/athlete/my_gyms', to: 'athlete#my_gyms'
  get '/athlete/my_courses', to: 'athlete#my_courses'
  get '/athlete/my_coupons', to: 'athlete#my_coupons'
  get '/athlete/my_worksheets', to: 'athlete#my_worksheets'

  #gym routes
  get '/gym/home', to: 'gym#home'
  get '/gym/profile', to: 'gym#profile'
  get '/gym/my_courses', to: 'gym#my_courses'
  get '/gym/my_coupons', to: 'gym#my_coupons'
  get '/gym/my_worksheets', to: 'gym#my_worksheets'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
