class Api::V1::TestsController < Api::BaseController
  before_action -> { doorkeeper_authorize! }

  # Just for fun :D
  def index
    render json: {
      items: [{
        id: 1,
        name: 'Michael'
      }, {
        id: 2,
        name: 'Pavel'
      }]
    }, status: :ok
  end
end
