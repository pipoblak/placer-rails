class Api::V1::Backoffice::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_admin!
end
