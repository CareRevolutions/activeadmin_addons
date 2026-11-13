module ActiveAdminAddons
  module Rails
    class Engine < ::Rails::Engine
      # No Sass engine is required here: the host app picks one (CareRev tools_app uses
      # dartsass-sprockets) and Sprockets compiles the .scss assets with it.
      require "xdan-datetimepicker-rails"
      require "require_all"
      require "active_material"

      initializer "initialize addons" do |app|
        require_rel "support"
        require_rel "addons"
        require_rel "active_admin_config"
        app.config.assets.precompile += %w(select.scss fileicons/*.png switches/switch_*.png
                                           material/icons *.svg)
      end
    end
  end
end
