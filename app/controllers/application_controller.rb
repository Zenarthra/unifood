class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :current_user, :logged_in?

  # If session order_id is not nil, then find that session order
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  # If current user variable is not set, then set it to the session user id
  	def current_user
       	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    # If current user
    def logged_in?
        !!current_user
    end
    # Not logged in, redirection
    def require_user
        if !logged_in?
            flash[:danger] = "You must be logged in to perform that action"
            redirect_to root_path
        end
    end

end

     