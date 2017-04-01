class Api::V1::BoardsController < Api::BaseController
  before_action :require_login!

  def create
    board = Board.new
    board.user_id = current_user.id
    respond_to do |format|
      if board.update(permitted_params)
        format.json { render json: board.hash, status: :ok }
      else
        format.json { render json: board.errors, status: 500 }
      end
    end
  end

  def permitted_params
    params.require(:board).permit(:name, :uuid)
  end
end
