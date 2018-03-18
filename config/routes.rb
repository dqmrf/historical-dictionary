Rails.application.routes.draw do
  use_doorkeeper do
    controllers :applications => 'oauth/applications'
  end

  devise_for :server_users, class_name: :ServerUser, path: :auth

  devise_scope :server_user do
    authenticated do
      root 'doorkeeper/applications#index'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :api do
    namespace :v1 do
      resources :tests, only: [:index]
    end
  end

  ### DO NOT PUT ROUTES BELOW HERE
  # the path below will catch everything and return 404s
  match '*unmatched_route',
        via: :all,
        to: 'application#raise_not_found',
        format: false
end
