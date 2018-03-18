class BaseController < ApplicationController
  before_action :authenticate_server_user!

  helper_method :current_user

  protected

  def current_user
    current_server_user
  end
end
