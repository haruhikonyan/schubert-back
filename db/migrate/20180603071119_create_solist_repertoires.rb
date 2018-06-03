class CreateSolistRepertoires < ActiveRecord::Migration[5.1]
  def change
    create_table :solist_repertoires do |t|
      t.belongs_to :solist, index: true, null: false
      t.belongs_to :repertoire, index: true, null: false

      t.timestamps
    end
  end
end
