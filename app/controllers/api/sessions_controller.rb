class Api::SessionsController < ApplicationController
    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if user == false
            render json: 'Credentials were wrong'
        else
            login!(user)
            redirect_to user_url(user)
        end
    end

    def new
        if current_user.nil?
            render :new
        else
            redirect_to user_url(current_user)
        end        
    end

    def destroy
    if current_user.nil?
      render json: "Not logged in.", status: 404
    else
      logout!
      render json: {}
    end
end
