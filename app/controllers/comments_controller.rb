class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        asa = Asa.find(params[:asa_id])
        comment = asa.comments.build(comment_params) 
        comment.user_id = current_user.id
        if comment.save
            flash[:success] = "Commented"
            redirect_back(fallback_location: root_path) 
        else
            flash[:success] = "Failed"
            redirect_back(fallback_location: root_path) 
        end
    end

    private

        def comment_params
            params.require(:comment).permit(:content)
        end
end