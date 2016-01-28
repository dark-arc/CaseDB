require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module CaseDB
  class Application < Rails::Application
    if Rails.env.development?
      config.exceptions_app =
        ActionDispatch::PublicExceptions.new(Rails.public_path)
    else
      config.exceptions_app = self.routes 
    end
  end
end
