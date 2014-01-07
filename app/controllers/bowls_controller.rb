class BowlsController < ApplicationController

  def index
    @bowls = Bowl.all.includes(:teams => :game_result)
  end


  def show
    @bowl = Bowl.where(id: params[:id]).includes(:picks => [:person, :team]).first if params[:id]
  end
end
