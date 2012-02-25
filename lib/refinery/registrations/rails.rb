module Refinery
  module Registrations
    class Engine < ::Rails::Engine

      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      initializer "refinery-registrations.url_helpers" do
        Refinery::Registrations.include_helpers(Refinery::Registrations::Controllers)
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "registrations"
          plugin.pathname = root
          plugin.activity = {
            :class => Registration
          }
        end
      end
    end
  end
end
