class TasksController < ApplicationController
    def show
    end


    def new
        @board = Board.find(params[:board_id])
        @task = current_user.tasks.build
    end

    def create
        @board = Board.find(params[:board_id])
        @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to root_path, notice: 'New task saved'
        else
            flash.now[:error] = 'Failed to make new task'
        render :new
        end
    end


    def edit
    end


    def update
    end



    def destroy
    end


    private
    def task_params
        params.require(:task).permit(:title,:content,:deadline).merge(board_id: @board.id)
    end

end
