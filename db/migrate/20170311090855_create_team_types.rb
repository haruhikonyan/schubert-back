class CreateTeamTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :team_types do |t|
      t.belongs_to :team, type: :uuid, index: true, null: false
      t.belongs_to :type, index: true, null: false
      t.timestamps
    end
  end
end
