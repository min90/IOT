class Notification < ApplicationRecord
  belongs_to :board

  def hash
    {"notification": { uuid: uuid, tag: tag } }
  end

  def remembered?
    tag ? "Yes" : "No"
  end

end
