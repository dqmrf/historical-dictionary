class API::V1::BaseController < ActionController::API
  skip_before_action :authenticate_admin_user!
end
