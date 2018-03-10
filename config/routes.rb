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
end
