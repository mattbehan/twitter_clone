Rails.application.routes.draw do
  resources :messages
	get '/' => 'home#index', as: "root"
	get 'users/message_user/' => 'users#message_user'
	devise_for :users, :controllers => { registrations: 'registrations' }
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# these aren't needed from the specs
	# resources :tweets, only: [:edit, :new, :update, :destroy, :create]
	resources :tweets, only: [:new, :create]

	resources :users, only: [:show] do
		resource :profile, only: [:edit, :update]
		resources :followings, only: [:create, :destroy]
		resources :blockings, only: [:create, :destroy]
	end


	get "/unauthorized" => 'home#unauthorized', as: "unauthorized_path"
end
