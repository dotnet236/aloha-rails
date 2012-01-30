require "aloha-rails/version"
require "aloha-rails/railtie" if defined?(::Rails)
require "aloha-rails/engine"  if defined?(::Rails)

module Aloha
  module Rails

    autoload :Helpers, 'aloha-rails/helpers'

  end
end
