class Bowl < ActiveRecord::Base
  has_many :bowl_team_relations, class_name: "BowlTeamRelation"
  has_many :teams, through: :bowl_team_relations
  has_many :picks, class_name: PersonBowlRelation

  def only_date
    date.to_date
  end

  def has_winner?
    bowl_team_relations.where(winner: true).count == 1
  end

  def winner
    team_id = bowl_team_relations.where(winner: true).first.try(:team_id)
    Team.find(team_id) if team_id
  end

  def set_winner
    winner = bowl_team_relations.order("score DESC").limit(1).first
    winner.update_attributes(winner: true)
  end

  def self.finished
    Bowl.includes(:bowl_team_relations).where("bowl_team_relations.winner", true).references(:bowl_team_relations)
  end
end
