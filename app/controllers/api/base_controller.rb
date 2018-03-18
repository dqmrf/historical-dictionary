class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  helper_method :current_user

  def doorkeeper_unauthorized_render_options(error: nil)
    { json: { error: (error.try(:description) || I18n.t('auth.error.not_authorized')) } }
  end

  # TODO: use I18n here
  def doorkeeper_forbidden_render_options(*)
    { json: { error: 'This action is outside the authorized scopes' } }
  end

  protected

  def current_user
    current_client_user
  end
end
