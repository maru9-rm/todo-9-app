class BoardsController < ApplicationController
    def index
        @boards = Board.all
    end

    def show
        @board = Board.find(params[:id])
    end


    def new
        @title = 'デイトラ'
    end


    def edit
        @title = 'デイトラ'
    end


end
