class SubsController < ApplicationController
    before_action :moderators_only!, only: [:edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def create
        @sub = sub.new(sub_params)

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def new
        @sub = Sub.new
        render :new
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def edit
        @sub = Sub.find(params[:id])
    end

    def update 
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def destroy 
    end

    protected
    def moderators_only!
        return if current_user.subs.find_by(id: params[:id])
        render json: "Forbidden", status: :forbidden
    end

    def sub_params
        self.params.require(:sub).permit(:title, :description, :moderator)
    end
end
