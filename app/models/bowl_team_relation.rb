class BowlTeamRelation < ActiveRecord::Base
  belongs_to :team
  belongs_to :bowl
  validates :team, presence: true, uniqueness: {scope: :bowl_id}
  validates :bowl, presence: true
end
