class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        byebug
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice:"Successfuly Created the Account!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    #This is needed as Forbidden Attributes Error will be thrown otherwise.
    def user_params
        params.require(:user).permit(:email,:password,:password_confirmation)
    end
end