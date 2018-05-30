class CreateCanonicalRouteInstrumentsForRecruits < ActiveRecord::Migration[5.1]
  def change
    create_table :canonical_route_instruments_for_recruits do |t|

      t.timestamps
    end
  end
end
