class ApplicationController < ActionController::Base

  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # # before_action :configure_permitted_parameters, if: :devise_controller?

  # # protected
  # # def configure_permitted_parameters
  # #   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :intro])
  # # end

  # private
  # def record_not_found
  #   render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
  # end
end
