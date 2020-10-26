class Api::V1::Public::ApiController < ApplicationController
  def index
    render json: { message: 'welcome to ially - v1'}, status: 200
  end
end
