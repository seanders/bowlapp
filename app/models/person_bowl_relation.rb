class PersonBowlRelation < ActiveRecord::Base
  belongs_to :bowl
  belongs_to :person
  belongs_to :team
end
