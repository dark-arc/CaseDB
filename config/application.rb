require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module CaseDB
  class Application < Rails::Application
    config.exeptions_app = self.routes
    config.autoload_paths << Rails.root.join('lib')
  end
end
