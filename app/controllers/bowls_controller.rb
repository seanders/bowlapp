class BowlsController < ApplicationController

  def index
    @bowls = Bowl.all.includes(:teams => :game_result)
  end

end
