module Overrides
    class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
    skip_before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
      def assign_provider_attrs(user, auth_hash)
        all_attrs = auth_hash["info"].slice(*user.attributes.keys)
        orig_val = ActionController::Parameters.permit_all_parameters
        ActionController::Parameters.permit_all_parameters = true
        permitted_attrs = ActionController::Parameters.new(all_attrs)
        permitted_attrs.permit({})
        user.assign_attributes(permitted_attrs)
        ActionController::Parameters.permit_all_parameters = orig_val
        user
      end

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :image])
        end
    end
end
