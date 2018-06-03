class CreateComposerCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :composer_countries do |t|
      t.belongs_to :composer, index: true, null: false
      t.belongs_to :country, index: true, null: false

      t.timestamps
    end
  end
end
