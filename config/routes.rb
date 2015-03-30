Rails.application.routes.draw do
  root 'home#index'
  get	'index', to: 'home#index'
  get	'about', to: 'home#about'
  
  resources :case_files do
    collection do 
      get 'search'
    end
		member do
			get 'link'
			post 'link'
			delete 'unlink'
		end
	end
	resources :events do
		collection do
			get 'search'
		end
	end
	resources :links do
		collection do
			get 'search'
		end
	end
  resources :people do
    collection do 
      get 'search'
    end
  end 
end
