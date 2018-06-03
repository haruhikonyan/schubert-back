class CreateConcertConductors < ActiveRecord::Migration[5.1]
  def change
    create_table :concert_conductors do |t|
      t.belongs_to :concert, type: :uuid, index: true, null: false
      t.belongs_to :conductor, index: true, null: false

      t.timestamps
    end
  end
end
