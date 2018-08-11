require_relative 'boot'

require 'rails/all'
require 'fog/aws'

Bundler.require(*Rails.groups)

module IMadeThis
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.generators do |g|
      g.test_framework :rspec,
                       fixture_replacement: :factory_bot,
                       view_specs: false,
                       helper_specs: false,
                       integration_tool: false,
                       routing_specs: false
    end
  end
end
