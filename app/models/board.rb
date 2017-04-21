class Board < ApplicationRecord
  belongs_to :user
  has_many :notifications

  def hash
    {"board": { name: name, uuid: uuid, remembered: remembered, user_id: user_id}}
  end

  def remembered?
    notification = notifications.where(board_id: self.id).order(created_at: :desc).first
    return false if notification.nil?
    notification.tag ? "Yes" : "No"
  end

  def color_status?
    notification = notifications.where(board_id: self.id).order(created_at: :desc).first
    return '#f44242' if notification.nil?
    notification.tag ? "#41f49d" : "#f44242"
  end

end
