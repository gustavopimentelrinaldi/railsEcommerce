class CommentsController < ApplicationController
    before_action :authenticate_member!
    def create
        @comment = Comment.new(comment_params)
        @comment.member = current_member

        if @comment.save
            flash[:notice] = "Comentário adicionado!"
            redirect_to(request.referrer || root_path)
        else
            flash[:alert] = "Você não está autorizado!!! :)"
            redirect_to(request.referrer || root_path)
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :ad_id)
    end
end
