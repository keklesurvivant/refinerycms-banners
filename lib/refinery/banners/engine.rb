module Refinery
  module Banners
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Banners

      engine_name :refinery_banners

      # initializer "static assets" do |app|
      #   app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      # end

      config.before_initialize do
        require 'page_extensions'
      end

      config.to_prepare do
        Page.send :include, Refinery::Banners::Extensions::Page
      end

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "banners"
          plugin.pathname = root
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.banners_admin_banners_path }
          # plugin.activity = {
          #   :class => Banner,
          #   :title => 'name'
          # }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Banners)
      end
    end
  end
end
