class Api::CommentsController < ApplicationController
    def new
        @comment = Comment.new(post_id: params[:post_id])
    end

    def create
        @comment = current_user.comments.new(comment_params)
        if @comment.save
            redirect_to post_url(@comment.post_id)
        else
            flash.now[:errors] = @comment.errors.full_messages
        end
    end

    def show
        @comment = Comment.find(params[:id])
        @new_comment = @comment.child_comments.new
    end

    protected
    def comment_params
        self.params.require(:comment).permit(:body, :post_id, :parent_comment_id)
    end
end