class CreateCanonicalRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :canonical_routes do |t|
      t.references :canonical_routable, polymorphic: true, index: {name: "index_canonical_routes"}
      t.string :canonical_id, null: false
      t.string :canonical_model_name, null: false
      t.string :label, null: false
      t.string :category, null: false
      t.integer :order_in_Category
      t.boolean :is_listed_on_top, default: false
      t.boolean :is_listed_on_model_top, default: false     
      t.timestamps
    end
  end
end
