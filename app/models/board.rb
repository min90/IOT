class Board < ApplicationRecord
  belongs_to :user
  has_many :notifications

  def hash
    {"board": { name: name, remembered: remembered, user_id: user_id}}
  end

  def remembered?
    notification = notifications.where(board_id: self.id).order(created_at: :desc).first
    return false if notification.nil?
    notification.tag ? "Yes" : "No"
  end

end
