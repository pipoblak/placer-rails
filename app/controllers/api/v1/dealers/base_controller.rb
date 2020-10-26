class Api::V1::Dealers::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_admin!
end
