class Api::UsersController < ApplicationController
    before_action :require_current_user!, except: [:create, :new]
    before_action :no_peeking!, only: [:show]

    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages
        end
    end

    def new
        @user = User.new
        render :new
    end

    def show
        if current_user.nil? || params[:id].to_i != current_user[:id]
          redirect_to new_session_url
          return
        end

        @user = User.find(params[:id])
        render :show
    end

    protected
    
    def no_peeking!
        redirect_to user_url(current_user) if params[:id].to_i != current_user.id
    end

    def user_params
        self.params.require(:user).permit(:username, :password, :email)
    end
end
