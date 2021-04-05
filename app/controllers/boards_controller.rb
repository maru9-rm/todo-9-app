class BoardsController < ApplicationController
    before_action :set_board, only: [:show]
    before_action :authenticate_user!


    def index
        @boards = Board.all
    end

    def show
    end


    def new
        @board = current_user.boards.build
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to board_path(@board), notice: 'Successfully saved'
        else
            flash.now[:error] = 'Failed to save'
            render :new
        end
    end


    def edit
        @board = current_user.boards.find(params[:id])
    end

    def update
        @board = current_user.boards.find(params[:id])
        if @board.update(board_params)
            redirect_to board_path(@board), notice: 'Successfully changed'
        else
            flash.now[:error] = 'Failed to change'
            render :edit
        end
    end

    def destroy
        board = current_user.boards.find(params[:id])
        board.destroy!
        redirect_to root_path, notice: 'Successfully deleted'
    end


    private
    def board_params
        params.require(:board).permit(:title, :content)
    end

    def set_board
        @board = Board.find(params[:id]) 
    end

end
