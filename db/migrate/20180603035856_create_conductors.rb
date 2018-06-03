class CreateConductors < ActiveRecord::Migration[5.1]
  def change
    create_table :conductors do |t|
      t.string :name, null: false
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
