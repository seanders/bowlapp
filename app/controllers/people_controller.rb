class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @person = Person.where(id: params[:id]).includes(:picks => [:bowl, :team]).first
  end
end
