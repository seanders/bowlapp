class PeopleController < ApplicationController

  def index
    @people = Person.all
  end
end
