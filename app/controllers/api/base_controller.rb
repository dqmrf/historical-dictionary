class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  def doorkeeper_unauthorized_render_options(error: nil)
    { json: { error: (error.try(:description) || I18n.t('auth.error.not_authorized')) } }
  end

  # TODO: use I18n here
  def doorkeeper_forbidden_render_options(*)
    { json: { error: 'This action is outside the authorized scopes' } }
  end

  protected

  def current_resource_owner
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def current_user
    current_resource_owner || super
  rescue ActiveRecord::RecordNotFound
    nil
  end
end
