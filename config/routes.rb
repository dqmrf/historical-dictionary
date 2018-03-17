Rails.application.routes.draw do
  use_doorkeeper

  devise_for :users, class_name: 'AdminUser', path: :auth

  devise_scope :user do
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
  match '*path(.:format)' => 'errors#not_found',
        via: [:get, :post, :put, :patch, :delete],
        constraints: -> (req) { req.format.html? }
end
