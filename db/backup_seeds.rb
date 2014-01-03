# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
bowls = [
  ["New Mexico", "Albuquerque", "21/12/2013"],
  ["Las Vegas", "Las Vegas", "21/12/2013"],
  ["Famous Idaho Potato", "Boise", "21/12/2013"],
  ["New Orleans", "New Orleans", "27/12/2013"],
  ["Beef 'O' Brady's", "St. Petersburg", "23/12/2013"],
  ["Hawaii", "Honolulu", "24/12/2013"],
  ["Little Caesars", "Detroit", "26/12/2013"],
  ["Poinsettia", "San Diego", "26/12/2013"],
  ["Military", "Washington, D.C.", "27/12/2013"],
  ["Texas", "Houston", "27/12/2013"],
  ["Fight Hunger", "San Francisco", "27/12/2013"],
  ["Pinstripe", "Bronx, NY", "28/12/2013"],
  ["Belk", "Charlotte", "28/12/2013"],
  ["Russell Athletic", "Orlando", "28/12/2013"],
  ["Buffalo Wild Wings", "Tempe", "28/12/2013"],
  ["Armed Forces", "Fort Worth", "30/12/2013"],
  ["Music City", "Nashville", "30/12/2013"],
  ["Alamo", "San Antonio", "30/12/2013"],
  ["Holiday", "San Diego", "30/12/2013"],
  ["AdvoCare V100", "Shreveport", "31/12/2013"],
  ["Sun", "El Paso", "31/12/2013"],
  ["Liberty", "Memphis", "31/12/2013"],
  ["Chick-fil-A", "Atlanta", "31/12/2013"],
  ["Gator", "Jacksonvllle", "01/01/2014"],
  ["Heart of Dallas", "Dallas", "01/01/2014"],
  ["Capital One", "Orlando", "01/01/2014"],
  ["Outback", "Tampa", "01/01/2014"],
  ["Rose", "Pasadena", "01/01/2014"],
  ["Fiesta", "Glendale, AZ", "01/01/2014"],
  ["Sugar", "New Orleans", "02/01/2014"],
  ["Orange", "Miami", "03/01/2014"],
  ["Cotton", "Arlington, Tx.", "03/01/2014"],
  ["BBVA Compass", "Birmingham", "04/01/2014"],
  ["GoDaddy.com", "Mobile", "05/01/2014"],
  ["BCS Title", "Pasadena", "07/01/2014"]
]

bowls.each do |bowl|
  Bowl.create(name: bowl[0], city: bowl[1], date: DateTime.parse(bowl[2]))
end

teams = [
  ["Colorado State", 89],
  ["Washington State", 66],
  ["USC", 62],
  ["Fresno State", 90],
  ["San Diego State", 93],
  ["Buffalo", 208],
  ["UL Lafayette", 45],
  ["Tulane", 106],
  ["East Carolina", 99],
  ["Ohio", 54],
  ["Oregon State", 61],
  ["Boise State", 112],
  ["Pittsburgh", 12],
  ["Bowling Green", 49],
  ["Utah State", 46],
  ["Northern Illinois", 42],
  ["Marshall", 176],
  ["Maryland", 5],
  ["Syracuse", 14],
  ["Minnesota", 31],
  ["Washington", 65],
  ["BYU", 88],
  ["Notre Dame", 104],
  ["Rutgers", 13],
  ["Cincinatti", 98],
  ["North Carolina", 6],
  ["Louisville", 100],
  ["Miami, FL", 11],
  ["Kansas State", 21],
  ["Michigan", 29],
  ["Middle Tennessee", 152],
  ["Navy", 102],
  ["Georgia Tech", 4],
  ["Ole Miss", 77],
  ["Oregon", 18],
  ["Texas", 83],
  ["Arizona State", 58],
  ["Texas Tech", 86],
  ["Arizona", 57],
  ["Boston College", 10],
  ["UCLA", 64],
  ["Virginia Tech", 16],
  ["Mississippi State", 78],
  ["Rice", 81],
  ["Duke", 2],
  ["Texas A&M", 84],
  ["Georgia", 68],
  ["Nebraska", 23],
  ["North Texas", 182],
  ["UNLV", 40],
  ["South Carolina", 70],
  ["Wisconsin", 36],
  ["Iowa", 28],
  ["LSU", 76],
  ["Michigan State", 30],
  ["Stanford", 63],
  ["Baylor", 79],
  ["UCF", 210],
  ["Alabama", 73],
  ["Oklahoma", 24],
  ["Missouri", 22],
  ["Oklahoma State", 25],
  ["Clemson", 1],
  ["Ohio State", 33],
  ["Houston", 80],
  ["Vanderbilt", 72],
  ["Arkansas State", 37],
  ["Ball State", 48],
  ["Florida State", 3],
  ["Auburn", 75]
]

teams.each do |team|
  Team.create(name: team[0], nbc_id: team[1])
end

## build teambolws relations
build_index = 0
Team.all.each_slice(2) do |team_pair|
  bowl = Bowl.all[build_index]
  BowlTeamRelation.create(bowl: bowl, team: team_pair[0])
  BowlTeamRelation.create(bowl: bowl, team: team_pair[1])
  build_index += 1
end
