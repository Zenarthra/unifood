class UsersController < ApplicationController

	before_action :require_same_user, only: [:edit, :update, :destroy]
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :require_admin, only: [:destroy]

	def new
		@user = User.new
	end

	def index
		#Pagination is required for this action
		@user = User.all
	end

	def show
		
	end

	def create
		@user = User.new(user_params)
       	if @user.save
          session[:user_id] = @user.id
          cookies.signed[:user_id] = @user.id
          flash[:success] = "Welcome #{@user.firstname} to Unifood!"
          redirect_to root_path
        else
          render 'new'
    	end
	end

	def edit
		
	end

	def update
		if @user.update(user_params)
        flash[:success] = "Your account was updated successfully"
        redirect_to root_path
      	else
        render 'edit'
      	end  
	end

	def destroy
		if !@user.admin?
			@user.destroy
			flash[:success] = "#{@user} has been deleted!"
		else
			flash[:danger] = "You cannot delete an admin user!"
		end
	end


	private
	def user_params 
		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :address, :postcode, :contact)
	end

	def require_same_user
        if current_user != @user and !current_user.admin?
          flash[:danger] = "You can only edit or delete your own account"
          redirect_to root_path
        end
    end
      
    def require_admin
        if logged_in? & !current_user.admin?
        flash[:danger] = "Only admin users can perform that action"
        redirect_to root_path
        end
    end

    def set_user
    	@user = User.find(params[:id])
    end

end
