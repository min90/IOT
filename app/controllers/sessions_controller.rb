class SessionsController < ApplicationController
  helper_method :user_boards

  def index
  end

  private

  def user_boards
    @boards = Board.where(user_id: current_user.id)
  end
end
