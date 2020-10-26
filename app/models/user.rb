# frozen_string_literal: true
class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable,  :confirmable, :lockable, :timeoutable
  include DeviseTokenAuth::Concerns::User

end