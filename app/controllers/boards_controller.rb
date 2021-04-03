class BoardsController < ApplicationController
    def index
        @boards = Board.all
    end

    def new
        @title = 'デイトラ'
    end


    def edit
        @title = 'デイトラ'
    end


end
