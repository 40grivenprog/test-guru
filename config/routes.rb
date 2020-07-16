Rails.application.routes.draw do

  get 'feedback/new'
  get 'gists/index'
	root 'tests#index'

	devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, :controllers => {:registrations => "users/registrations", :sessions => 'users/sessions'}
	resources :feedbacks, only: [:new, :create]
	resources :badges

	resources :tests, only: :index do
		resources :questions , only: [:index, :show], shallow: true do
			resources :answers, shallow: true, only: :show
		end

		member do
			post :start
		end
	end

	#GET /test_passages/101/result
	resources :test_passages, only: %i[show update] do
		member do
			get :result
			post :gist
			post :restart
		end
	end

	namespace :admin do
		resources :gists, only: :index
	  resources :tests do
	  	patch :update_inline, on: :member
			resources :questions , shallow: true do
				resources :answers, shallow: true, except: :index
		end
	end
end

end
