require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module IallyBack
  class Application < Rails::Application
    config.load_defaults 6.0

    #CORS Config
    config.middleware.use Rack::Cors do
      allow do
        origins '*' 
        resource '*',
        headers: :any,
        expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
        methods: [:get, :post, :options, :delete, :put, :patch]
      end
    end

    config.generators do |g|
      g.test_framework :rspec #set rspec as test framework
    end

    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
