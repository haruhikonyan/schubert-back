class CreateTunes < ActiveRecord::Migration[5.1]
  def change
    create_table :tunes do |t|
      t.string :title, null: false
      t.text :description

      t.belongs_to :composer, null: false

      t.timestamps
    end
  end
end
