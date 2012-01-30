class Aloha::ConfigGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_coffee
    template 'aloha-config.coffee', File.join('app', 'assets', 'javascripts', 'aloha-config.coffee')
  end
end
