class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def store_return_to
    session[:return_to] = request.url
  end

  def after_sign_in_path_for(resource)
    session.delete(:return_to) || current_user
  end

  def after_sign_up_path_for(resource)
    current_user
  end

end