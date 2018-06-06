class CreateComposers < ActiveRecord::Migration[5.1]
  def change
    create_table :composers do |t|
      t.string :display_name, null: false
      t.string :full_name
      t.text :description

      t.timestamps
    end
  end
end
