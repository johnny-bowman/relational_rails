class CreateClimbs < ActiveRecord::Migration[5.2]
  def change
    create_table :climbs do |t|
      t.string :name
      t.integer :pitches
      t.boolean :trad

      t.timestamps
    end
  end
end
