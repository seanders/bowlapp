class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :nbc_id
      t.integer :points_cache
      t.string :image_url
      t.timestamps
    end

    add_index :teams, [:name], unique: true
  end
end
