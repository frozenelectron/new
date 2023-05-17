class PasswordResetsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_later 
            #deliver_later is used to send mail as a background job since the sending the mail needs some time and will take time for the request
            #deliver_now
        end
        
        redirect_to root_path, notice: "If an account with that email was found, we have sent the link to reset your password."
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to signin_path, alert: "Your token has expired. Please try again!"
    end
    
    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to root_path, notice: "Your password was successfully updated!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def password_params
        params.require(:user).permit(:password,:password_confirmation)
    end

end