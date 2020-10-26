class Api::V1::Backoffice::UsersController < Api::V1::Backoffice::BaseController
  def index
    render json: { message: 'UserController test - v1'}, status: 200
  end
end
