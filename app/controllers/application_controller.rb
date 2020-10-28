class ApplicationController < ActionController::Base
  before_action :search_default
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name ,:icon,:icon_cache, :profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name ,:icon ,:icon_cache, :profile])
  end

  def search_default
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true)
  end

end
