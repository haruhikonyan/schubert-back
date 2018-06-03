class CreateSolists < ActiveRecord::Migration[5.1]
  def change
    create_table :solists do |t|
      t.string :name, null: false
      t.string :url
      t.text :description

      t.belongs_to :instrument, null: false

      t.timestamps
    end
  end
end
