class Notification < ApplicationRecord
  belongs_to :board

  def hash
    {"notification": { board_id: board.uuid, tag: tag } }
  end

  def remembered?
    tag ? "Yes" : "No"
  end

end
