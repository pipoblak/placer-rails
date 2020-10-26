class Api::V1::Dealers::DealersController < Api::V1::Dealers::BaseController
  def index
    render json: { message: 'DealersController test - v1'}, status: 200
  end
end
