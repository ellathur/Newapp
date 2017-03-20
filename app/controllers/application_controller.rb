class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def product_params
    params.require(:product).permit(:name, :description, :image_url, :color)
  end
  
end
