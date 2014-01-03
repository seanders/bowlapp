class CreateBowls < ActiveRecord::Migration
  def change
    create_table :bowls do |t|
      t.string :name, null: false
      t.datetime :date, null: false
      t.string :city, null: false
      t.string :image_url
      t.timestamps
    end
  end
end
