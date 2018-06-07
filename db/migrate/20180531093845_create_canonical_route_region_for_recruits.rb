class CreateCanonicalRouteRegionForRecruits < ActiveRecord::Migration[5.1]
  def change
    create_table :canonical_route_region_for_recruits do |t|
      t.belongs_to :region
      t.timestamps
    end
  end
end
