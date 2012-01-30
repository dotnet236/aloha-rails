require "aloha-rails/version"
require "aloha-rails/railtie" if defined?(::Rails)
require "aloha-rails/engine"  if defined?(::Rails)

module Aloha
  module Rails

    autoload :Helpers, 'aloha-rails/helpers'

    mattr_accessor :default_plugins

    self.default_plugins = ['common/format', 'common/list', 'common/link']
  end
end
