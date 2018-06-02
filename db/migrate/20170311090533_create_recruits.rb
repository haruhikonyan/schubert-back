class CreateRecruits < ActiveRecord::Migration[5.1]
  def change
    create_table :recruits, id: :uuid do |t|
      t.string :title, null: false
      t.string :practice_place
      t.string :practice_time
      t.text :description
      t.datetime :published_from, null: false
      t.datetime :published_to, null: false

      t.belongs_to :team, foreign_key: true, type: :uuid, null: false

      t.timestamps
    end
  end
end
