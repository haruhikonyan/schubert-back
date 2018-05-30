class CreateCanonicalRouteInstrumentsForRecruitsRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :canonical_route_instruments_for_recruits_relations do |t|
      t.belongs_to :canonical_route_instruments_for_recruit, index: {name: "index_crifrr_on_canonical_route_instruments_for_recruit_id"}, null: false
      t.belongs_to :instrument, index: {name: "index_crifrr_on_instrument_id"}, null: false

      t.timestamps
    end
  end
end
