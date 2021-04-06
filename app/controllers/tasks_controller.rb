class TasksController < ApplicationController
    before_action :authenticate_user!

    def show
        @task = Task.find(params[:id])
        @comments = @task.comments
    end


    def new
        @board = Board.find(params[:board_id])
        @task = current_user.tasks.build
    end

    def create
        @board = Board.find(params[:board_id])
        @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to board_path(@board), notice: 'New task saved'
        else
            flash.now[:error] = 'Failed to make new task'
        render :new
        end
    end

    def edit
        @board = Board.find(params[:board_id])
        @task = current_user.tasks.find(params[:id])
    end

    def update
        @board = Board.find(params[:board_id])
        @task = current_user.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to board_task_path(@task), notice: 'Successfully changed'
        else
            flash.now[:error] = 'Failed to change'
            render :edit
        end
    end

    def destroy
        task = current_user.tasks.find(params[:id])
        task.destroy!
        redirect_to root_path, notice: 'Successfully deleted'
    end

    private
    def task_params
        params.require(:task).permit(:title,:content,:deadline, :eyecatch).merge(board_id: @board.id)
    end

end
