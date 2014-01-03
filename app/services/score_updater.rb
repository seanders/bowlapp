 class ScoreUpdater

  module Week
    TWO = Date.parse("30/12/2013") #week 2 ends Dec 30
    THREE = Date.parse("31/12/2013") #week 3 starts on Dec 31, 2013
  end

  def self.run(period = nil)
    #returns array of xml_tags containing info for each bowl game
    games_xml_array = get_score_data(period)

    #turn each into hash then use data to find/update scores
    update_count = 0
    games_xml_array.each do |game_xml|
      game_hash = Hash.from_xml(game_xml)['ticker_entry']

      #don't need to update if the game hasn't been played yet
      next if game_not_started?(game_hash)
      #don't update if game already has winner
      next if game_has_winner?(game_hash)

      #if the game has finished, don't need to udpate
      if game_finished?(game_hash)
        finished_game_update(game_hash)
        update_count += 1
      else
        regular_update(game_hash)
        update_count += 1
      end
    end

    Rails.logger.info("Finished updating #{update_count} records.")
  end

  def self.get_score_data(period)
    period ||= Date.today >= Week::THREE ? "19" : "18"
    Rails.logger.info "Updating scores using period: #{period} ..."
    body = Net::HTTP.get_response(URI("http://scores.nbcsports.com/ticker/data/gamesMSNBC.js.asp?sport=CFB&period=#{period}")).body
    JSON.parse(body)['games']
  end

  def self.game_not_started?(game_hash)
    if game_hash['gamestate']['status'] == 'Pre-Game'
      Rails.logger.info("Game not started. Skipping update...")
      true
    else
      false
    end
  end

  def self.game_finished?(game_hash)
    #to make sure we don't miss data, we will only say a game is finished if it was finished the day before
    game_hash['gamestate']['status'] == 'Final'
  end

  def self.game_has_winner?(game_hash)
    p game_hash
    bowl = Bowl.includes(:teams).where("teams.nbc_id = ?", game_hash['visiting_team']['id']).references(:teams).first
    #if winner is already assigned, do nothing
    if bowl.has_winner?
      Rails.logger.info "#{bowl.name} has winner. Skipping update..."
      true
    else
      false
    end
  end

  def self.finished_game_update(game_hash)
    bowl = Bowl.includes(:teams).where("teams.nbc_id = ?", game_hash['visiting_team']['id']).references(:teams).first

    #update scores
    regular_update(game_hash)

    #assign winner
    bowl.set_winner
  end

  def self.regular_update(game_hash)
    #find visitng team and update its score
    visiting_team_raw_data = game_hash['visiting_team']
    visitng_team = Team.find_by_nbc_id(visiting_team_raw_data['id'])
    #score is an array of score_info. first value is total score
    visitng_team.game_result.update_attributes(score: visiting_team_raw_data['score'].first)

    #find home team and update its score
    home_team_raw_data = game_hash['home_team']
    home_team = Team.find_by_nbc_id(home_team_raw_data['id'])
    #score is an array of score_info. first value is total score
    home_team.game_result.update_attributes(score: home_team_raw_data['score'].first)
  end

end
