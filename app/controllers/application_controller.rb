class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #def product_params
  #  params.require(:product).permit(:name, :description, :image_url, :color)
  #end
  #5.5 authorization
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

end
