Rails.application.routes.draw do
  root 'home#index'
  get	'index', to: 'home#index'
  get	'about', to: 'home#about'
  
  resources :case_files
  resources :events
  resources :links
  resources :people

  resources :users
  resources :session
end
