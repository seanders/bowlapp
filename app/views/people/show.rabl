object @person

extends "people/partials/base"

node :right_pick_count do |person|
  person.correct_pick_count
end

node :confidence_points do |person|
  person.confidence_points
end

child :picks => :picks do
  attributes :point_value
  child :team do
    attributes :name, :image_url
  end
  child :bowl do
    attributes :name, :date
    child :teams do
      attributes :id, :name, :image_url
      child :game_result => :game_result do
        attributes :id, :bowl_id, :team_id, :score, :winner
      end
    end
  end
end
