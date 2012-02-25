require 'refinerycms-base'

module Refinery
  module Registrations

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    module Controllers
      autoload :Helpers, 'refinery/registrations/controllers/helpers'
    end

    # Include helpers in the given scope to AC.
    def self.include_helpers(scope)
      ActiveSupport.on_load(:action_controller) do
        include scope::Helpers if defined?(scope::Helpers)
      end
    end

  end
end

require 'refinery/registrations/rails'

require File.expand_path('../refinerycms-registration_sessions', __FILE__)
require File.expand_path('../refinerycms-children', __FILE__)
require File.expand_path('../refinerycms-child_registrations', __FILE__)
require File.expand_path('../refinerycms-educational_stages', __FILE__)
require File.expand_path('../refinerycms-fees', __FILE__)