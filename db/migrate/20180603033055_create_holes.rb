class CreateHoles < ActiveRecord::Migration[5.1]
  def change
    create_table :holes do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :url
      t.text :description

      t.belongs_to :region, null: false

      t.timestamps
    end
  end
end
