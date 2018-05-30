class CreateCanonicalRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :canonical_routes do |t|
      t.references :canonical_routable, polymorphic: true, index: {name: "index_canonical_routes"}
      t.string :path
      t.string :label
      t.string :category
      t.integer :orderInCategory
      t.boolean :isListedOnTop
      t.timestamps
    end
  end
end
