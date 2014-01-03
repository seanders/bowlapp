class Team < ActiveRecord::Base
  has_one :game_result, class_name: "BowlTeamRelation"
  has_one :bowl, through: :bowl_team_relation
  has_many :picks, class_name: PersonBowlRelation

  def winner?
    game_result.winner
  end
end
