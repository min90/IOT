class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :uuid
      t.boolean :remembered
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
