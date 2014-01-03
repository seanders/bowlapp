class CreatePersonBowlRelations < ActiveRecord::Migration
  def change
    create_table :person_bowl_relations do |t|
      t.integer :person_id, null: false
      t.integer :bowl_id, null: false
      t.integer :team_id, null: false
      t.integer :point_value, null: false
      t.timestamps
    end
  end
end
