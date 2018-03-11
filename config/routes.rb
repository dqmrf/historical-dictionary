Rails.application.routes.draw do
  devise_for :users, class_name: 'AdminUser', path: :auth

  devise_scope :user do
    authenticated do
      use_doorkeeper
      root 'doorkeeper/applications#index'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  ### DO NOT PUT ROUTES BELOW HERE
  # the path below will catch everything and return 404s
  match '*path(.:format)' => 'errors#not_found',
        via: [:get, :post, :put, :patch, :delete],
        constraints: -> (req) { req.format.html? }
end
