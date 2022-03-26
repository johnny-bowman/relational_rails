class AddCragToClimbs < ActiveRecord::Migration[5.2]
  def change
    add_reference :climbs, :crag, foreign_key: true
  end
end
