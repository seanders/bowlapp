class AddAwsUrls < ActiveRecord::Migration
  def up
    images = [
      "https://s3-us-west-1.amazonaws.com/bowlapp/new_mexico_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/maaco_las_vegas_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/famous_idaho_potato_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/new_orleans_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/beef_o_brady_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/hawaii_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/little_caesars_pizza_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/pointsettia_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/military_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/texas_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/kraft_fight_hunger_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/pintstripe_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/belk_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/russel_athletic_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/buffalo_wild_wings_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/armed_forces_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/music_city_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/alamo_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/holiday_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/advocare_100_independence_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/sun_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/liberty_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/chick_fil_a_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/gator_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/heart_of_dallas_bowl.png",
      "https://s3-us-west-1.amazonaws.com/bowlapp/capital_one_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/outback_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/rose_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/tostitos_fiesta_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/sugar_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/orange_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/cotton_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/bbva_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/go_daddy_bowl.gif",
      "https://s3-us-west-1.amazonaws.com/bowlapp/bcs_championship_bowl.gif",
    ]

    Bowl.all.each_with_index do |bowl, index|
      bowl.update_attributes(image_url: images[index])
    end
  end

  def down
    remove_column :bowls, :image_url
    add_column :bowls, :image_url, :string
  end
end
