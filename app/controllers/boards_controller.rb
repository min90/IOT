class BoardsController < ApplicationController
  helper_method :user_boards

  def index
  end

  def show
    @board = Board.find(params[:id])
    @notifications = @board.notifications
  end

  def edit
  end


  private

  def user_boards
    @boards = Board.where(user_id: current_user.id)
  end
end
