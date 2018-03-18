class ErrorsController < BaseController
  skip_before_action :authenticate_server_user!

  def not_found
    render status: :not_found
  end
end
