class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_artist
    @current_artist ||= Artist.find(session[:artist_id]) if session[:artist_id].present?
  end
  helper_method :current_artist
  
  private
 
  def require_login
    unless session[:student_id] != nil
      redirect_to login_page_path # halts request cycle
    end
  end
end
