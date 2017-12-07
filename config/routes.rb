Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :profiles, only: [:show, :update]

    end

  end
end
