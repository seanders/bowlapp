collection @people

extends "people/partials/base"

node :right_pick_count do |person|
  person.correct_pick_count
end

node :confidence_points do |person|
  person.confidence_points
end
