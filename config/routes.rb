SampleApp::Application.routes.draw do
  resources :users  
  resources :sessions, only: [:create]
  
  get "users/new"
 
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/signin',  to: 'sessions#new', via: 'get' 
  match '/signup',  to: 'users#new', via: 'get'  
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  root  'static_pages#home'
end
