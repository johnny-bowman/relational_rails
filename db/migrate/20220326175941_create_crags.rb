class CreateCrags < ActiveRecord::Migration[5.2]
  def change
    create_table :crags do |t|
      t.string :name
      t.boolean :year_round
      t.integer :outhouses

      t.timestamps
    end
  end
end
