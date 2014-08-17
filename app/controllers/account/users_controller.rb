module Account
  class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        flash[:success] = "Successfully updated  user profile"
        redirect_to root_path
      else
        flash[:error] = "Error in editing user profile" 
        render :edit
      end
    end

    def user_params
      params.require(:user).permit!
    end
  end
end
