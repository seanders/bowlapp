object @bowl

extends "bowls/partials/base"

child :picks => :picks do
  attributes :point_value

  child :person => :person do
    extends "people/partials/base"
  end

  child :team => :picked_team do
    attributes :id, :name, :image_url
  end
end

child @bowl.winner => :winning_team do
  attributes :id, :name, :image_url
end
