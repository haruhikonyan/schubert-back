class CreateCanonicalRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :canonical_routes do |t|
      t.references :canonical_routable, polymorphic: true, index: {name: "index_canonical_routes"}
      t.string :path
      t.string :label
      t.string :category
      t.integer :order_in_Category
      t.boolean :is_listed_on_top
      t.boolean :is_listed_on_model_top      
      t.timestamps
    end
  end
end
