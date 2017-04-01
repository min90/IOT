class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :uuid
      t.references :board, foreign_key: true
      t.boolean :tag

      t.timestamps
    end
  end
end
