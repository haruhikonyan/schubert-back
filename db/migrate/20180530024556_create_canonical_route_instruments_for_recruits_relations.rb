class CreateCanonicalRouteInstrumentsForRecruitsRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :canonical_route_instruments_for_recruits_relations do |t|
      t.belongs_to :canonical_route_instruments_for_recruit, index: true, null: false
      t.belongs_to :instrument, index: true, null: false

      t.timestamps
    end
  end
end
