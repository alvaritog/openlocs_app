ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Force rails server to listen on 0.0.0.0 by default, allowing "rails s" instead of "rails s -b 0.0.0.0" => http://stackoverflow.com/a/27996166
require 'rails/commands/server'
module Rails
  class Server
    alias :default_options_alias :default_options
    def default_options
      default_options_alias.merge!(:Host => '0.0.0.0')
    end
  end
end
