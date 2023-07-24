class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
 	protected
 	
 	def configure_permitted_parameters
 		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, images_attributes: [:url, :context, :id]])
 		devise_parameter_sanitizer.permit(:account_update, keys: [:name, images_attributes: [:url, :context, :id]])
 	end
	def after_sign_in_path_for(resource)
        pictures_path
    end

    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
            redirect_to pictures_path, notice: "You are not authorized to perform this action"
        end
    end
end
