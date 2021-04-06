class CommentsController < ApplicationController
    def new
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build
    end

    def create
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build(comment_params)
        # binding.pry
        if @comment.save
            redirect_to board_task_path(@task.board_id, @task), notice: 'Successfully Commented'
        else
            flash.now[:error] = 'Failed to comment'
        render :new
        end
    end


    private
    def comment_params
        params.require(:comment).permit(:content,:board_id, :task_id).merge(user_id: current_user.id)
    end

end