module Spree
  module Admin
    class ThemeSettingsController < Spree::Admin::BaseController

      def edit
        @theme_settings = [ :theme_background_color ]
      end

      def update
        params.each do |name, value|
          next unless Spree::Config.has_preference? name
          Spree::Config[name] = value
        end
        flash[:success] = Spree.t(:successfully_updated, :resource => Spree.t(:theme_settings))

        redirect_to edit_admin_theme_settings_path
      end
    end
  end
end
