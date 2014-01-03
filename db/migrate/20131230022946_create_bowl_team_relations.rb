class CreateBowlTeamRelations < ActiveRecord::Migration
  def change
    create_table :bowl_team_relations do |t|
      t.integer :bowl_id, null: false
      t.integer :team_id, null: false
      t.integer :score, null: false, default: 0
      t.boolean :winner, nul: false, default: false
      t.timestamps
    end

    add_index :bowl_team_relations, [:team_id], unique: true
  end
end
