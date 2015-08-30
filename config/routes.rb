Rails.application.routes.draw do
  root 'home#index'
  get	'index', to: 'home#index'
  get	'about', to: 'home#about'
  
  resources :case_files
  resources :events
  resources :links
  resources :people

  resources :users 
  resources :session, only: [:new,:create,:destroy]

  [404,422,500].each do |code|
    get "#{code}", :to => "errors#show", :code => code
  end
end
