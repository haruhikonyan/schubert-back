class AddColmnToRecruit < ActiveRecord::Migration[5.1]
  def change
    add_reference :recruits, :concert, type: :uuid
  end
end
