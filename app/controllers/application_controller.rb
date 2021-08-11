class ApplicationController < ActionController::Base
    include Pagy::Backend
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :initialize_session
    before_action :load_cart

    private

    def initialize_session
        session[:cart] ||= [] # empty cart = empty array
    end

    def load_cart
        @cart = Listing.find(session[:cart])
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :role_id])
    end 
end
