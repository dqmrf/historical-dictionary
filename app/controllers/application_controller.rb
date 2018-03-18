class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_client_user

  protected

  def current_client_user
    @current_client_user ||= User.find(doorkeeper_token&.resource_owner_id)
  rescue ActiveRecord::RecordNotFound
    nil
  end
end
