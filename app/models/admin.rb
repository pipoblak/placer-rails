# frozen_string_literal: true

class Admin < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
