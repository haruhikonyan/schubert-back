class CreateRepertoires < ActiveRecord::Migration[5.1]
  def change
    create_table :repertoires do |t|
      t.string :arranger
      t.text :description

      t.belongs_to :concert, foreign_key: true, type: :uuid, null: false
      t.belongs_to :tune, null: false

      t.timestamps
    end
  end
end
