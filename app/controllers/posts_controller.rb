def PostsController < ApplicationController
    before_action :authors_only!, only: [:edit, :update]

    def new
        @post = Post.new
        render :new
    end

    def create 
        @post = Pub.create(post_params)
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
        end
    end

    def show 
        @post = post.find(params[:id])
        render :show 
    end

    def edit 
        @post = post.find(params[:id])
    end


    def update  
        @post = post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end


    protected 

    def post_params
        self.params.require(:post).permit(:title, :url, :content, :user_id, :sub_ids)
    end

    def authors_only!
        return if current_user.posts.find_by(id: params[:id])
        render json: "Forbidden", status: :forbidden
    end
end