class SessionsController < ApplicationController
    def delete
        session[:user_id] = nil
        redirect_to root_path, notice: "You've logged out successfully!"
    end

    def new
    end

    def create
        Current.user = User.find_by(email: params[:email])
        if Current.user.present? && Current.user.authenticate(params[:password])
            session[:user_id] = Current.user.id
            redirect_to root_path, notice: "Logged In Successfully!"
        else
            flash[:alert] = "Invalid Credentials Entered!"
            render :new, status: :unprocessable_entity
        end
    end
end
