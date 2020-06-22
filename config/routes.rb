Rails.application.routes.draw do

	root 'tests#index'

	devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, :controllers => {:registrations => "users/registrations", :sessions => 'users/sessions'}

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
		end
	end

	namespace :admin do
	  resources :tests do
			resources :questions , shallow: true do
				resources :answers, shallow: true, except: :index
		end
	end
end

end
