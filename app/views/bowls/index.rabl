collection @bowls

extends "bowls/partials/base"

child :teams do
  attributes :id, :name, :image_url
  child :game_result do
    attributes :id, :bowl_id, :team_id, :score, :winner
  end
end
