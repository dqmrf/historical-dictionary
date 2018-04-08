class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_server_user
  helper_method :current_client_user

  rescue_from ActiveRecord::RecordNotFound, with: :not_found!
  rescue_from ActionController::RoutingError, with: :not_found!
  rescue_from ActionController::InvalidAuthenticityToken, with: :unprocessable_entity!

  def raise_not_found
    raise ActionController::RoutingError, "No route matches #{params[:unmatched_route]}"
  end

  protected

  def forbidden!
    respond_with_error(403)
  end

  def not_found!
    respond_with_error(404)
  end

  def unprocessable_entity!
    respond_with_error(422)
  end

  def respond_with_error(code)
    respond_to do |format|
      format.any  { head code }
      format.html do
        # TODO: create 'error' layout
        render "errors/#{code}", status: code
      end
    end
  end

  def current_server_user
    current_user
  end

  def current_client_user
    @current_client_user ||= User.find(doorkeeper_token&.resource_owner_id)
  rescue ActiveRecord::RecordNotFound
    nil
  end
end
