class SessionsController < ApplicationController

	def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase) 
        #Params is request information from the browser,
        #In the session hash, we look at the email value
        if user && user.authenticate(params[:session][:password])
            cookies.signed[:user_id] = user.id  #Setting a cookie, the signed cookie can be any name
            session[:user_id] = user.id  #Setting the sessions, the session can be any name
            flash[:success] = "You have successfully logged in"
            redirect_to root_path
        else
            flash.now[:danger] = "There was something wrong with your login information"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path

    end


end
