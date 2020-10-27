class Api::V1::Public::ApiController < ApplicationController
  def index
    render json: { message: 'welcome to placer rails - v1'}, status: 200
  end
end
