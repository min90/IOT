class Api::V1::NotificationsController < Api::BaseController
  before_action :require_login!, except: [:create]

  def create

    tag_ = params[:notification][:tag]
    notification = Notification.new

    tag = tag_.slice(0,1)
    board_id = tag_.slice(1,tag_.length)

    notification.board_id = find_matching_board(board_id)
    notification.tag = set_tag(tag)
    respond_to do |format|
      if notification.save
      # uuid skal matche med board
        format.json { render json: notification.hash, status: :ok}
      else
        format.json {render json: notification.errors, status: 500}
      end
    end
  end

  def set_tag(tag)
    tag == "1"
  end

  def find_matching_board(uuid)
    boards = Board.where(uuid: uuid)
    return 0 if boards.empty?
    boards.first.id
  end

end
