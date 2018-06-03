class CreateConcerts < ActiveRecord::Migration[5.1]
  def change
    create_table :concerts, id: :uuid  do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.time :doors_open
      t.time :cirtain_time, null: false
      t.text :description

      t.belongs_to :team, foreign_key: true, type: :uuid, null: false

      t.timestamps
    end
  end
end
