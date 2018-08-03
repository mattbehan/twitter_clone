Rails.application.routes.draw do
	get '/' => 'home#index', as: "root"
	devise_for :users, :controllers => { registrations: 'registrations' }
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# these aren't needed from the specs
	# resources :tweets, only: [:edit, :new, :update, :destroy, :create]
	resources :tweets, only: [:new, :create]
	get "tweets/timeline" => "tweets#timeline", as: "tweets_timeline_path"

	resources :users, only: [:show] do
		resource :profile, only: [:edit, :update]
	end

	get "/unauthorized" => 'home#unauthorized', as: "unauthorized_path"
end
