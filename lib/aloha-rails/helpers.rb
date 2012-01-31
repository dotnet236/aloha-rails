require 'action_view'
module Aloha
  module Rails

    module Helpers
      def aloha_script_tag(options={})
        options = {
          type: 'text/javascript',
          src: '/assets/aloha/lib/aloha.js',
          plugins: Aloha::Rails.default_plugins,
          extra_plugins: []
        }.update(options)

        plugins = options.delete(:plugins) || []
        plugins += options.delete(:extra_plugins)

        if plugins.any?
          options[:data] = {
            'aloha-plugins' => plugins.join(',') 
          }
        end

        content_tag :script, nil, options
      end
    end

  end
end
