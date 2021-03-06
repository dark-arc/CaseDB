Rails.application.routes.draw do
  root 'home#index'
  get	'index', to: 'home#index'
  get	'about', to: 'home#about'

  [404,422,500].each do |code|
    get "#{code}", :to => "errors#show", :code => code, :defaults => {:format => :html}
  end

  resources :case_files
  resources :events
  resources :locations
  resources :people do
    resources :marks
  end
  # Configurables
  resources :anatomies
  resources :mark_types
  
  # Auth
  resources :users 
  resources :session, only: [:new,:create,:destroy]
end
