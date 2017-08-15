Rails.application.routes.draw do
  get 'sessions/new'

	root 'static_pages#home'
	get '/help', to: 'static_pages#help', as: 'helf'
	get '/contact', to: 'static_pages#contact'
	get '/about', to: 'static_pages#about'
	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'
	get '/login', to: 'sessions#new'
	delete '/logout', to: 'sessions#destroy'
	post'/login', to: 'sessions#create'
	get '/edit', to: 'users#edit'
	patch '/edit', to: 'users#update'	
	resources :users
	resources :microposts, only: [:create, :destroy]
end
