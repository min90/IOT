class Api::V1::NotificationsController < Api::BaseController
  before_action :require_login!

  def create
    uuid = params[:notification][:uuid]
    tag_ = params[:notification][:tag]
    notification = Notification.new
    notification.board_id = find_matching_board(uuid)
    notification.tag = set_tag(tag_)
    respond_to do |format|
      if notification.update(permitted_params)
      # uuid skal matche med board
        format.json { render json: notification.hash, status: :ok}
      else
        format.json {render json: notification.errors, status: 500}
      end
    end
  end

  def set_tag(tag)
    tag == "R"
  end

  def find_matching_board(uuid)
    board = Board.where(uuid: uuid, user_id: current_user.id).first
    return 0 if board.nil?
    board.id
  end


  def permitted_params
    params.require(:notification).permit(:uuid)
  end

end
