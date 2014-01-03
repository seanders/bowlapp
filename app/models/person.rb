class Person < ActiveRecord::Base
  has_many :picks, class_name: PersonBowlRelation

  def correct_picks
    Team.where(id: picks.pluck(:team_id)).joins(:game_result).where("bowl_team_relations.winner" => true)
  end

  def correct_pick_count
    correct_picks.count
  end

  def confidence_points
    #bad. should be boolean flag on the picks once game finishes
    team_ids = correct_picks.pluck(:team_id)
    picks.where(team_id: team_ids).sum(:point_value)
  end
end
