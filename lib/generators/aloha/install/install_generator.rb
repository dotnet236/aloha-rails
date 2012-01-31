class Aloha::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
  class_option :js, :type => :boolean, :default => false, :desc => "Install .js file instead of coffeescript"

  def copy_asset
    if options[:js]
      template "aloha-config.js", File.join("app", "assets", "javascripts", "aloha-config.js")
    else
      template "aloha-config.coffee", File.join("app", "assets", "javascripts", "aloha-config.coffee")
    end
  end

  def copy_initializer
    template "aloha.rb", File.join("config", "initializers", "aloha.rb")
  end

  def load_javascript
    appjs = File.join "app", "assets", "javascripts", "application.js"
    if File.exist? appjs
      insert_into_file appjs, "//= require aloha-config\n", :after => "jquery_ujs\n"
    else
      copy_file "application.js", appjs
    end
  end
end
