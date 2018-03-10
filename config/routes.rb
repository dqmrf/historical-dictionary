Rails.application.routes.draw do
  devise_for :admin_users

  devise_scope :admin_user do
    authenticated :admin_user do
      use_doorkeeper
      root 'doorkeeper/applications#index'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
