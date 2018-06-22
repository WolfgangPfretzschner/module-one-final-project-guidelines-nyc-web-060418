require_relative '../config/environment'


# Team.create_team_data
# binding.pry

# Event.create_events_data


puts "Welcome to the 2018 FIFA WorldCup Live Database"

puts "================================================="
input = ""
while input != "exit"

  puts "Waht country are you interested in, please pick by number."


  puts " 1	Russia     |   2	Saudi Arabia    |   3	Egypt
         4	Uruguay    |   5	Portugal        |   6	Spain
         7	Morocco    |   8	Iran            |   9	France
        10	Australia  |  11	Peru            |  12	Denmark
        13	Argentina  |  14	Iceland         |  15	Croatia
        16	Nigeria    |  17	Brazil          |  18	Switzerland
        19	Costa Rica |  20	Serbia          |  21	Germany
        22	Mexico     |  23	Sweden          |  24	Korea Republic
        25	Belgium    |  26	Panama          |  27	Tunisia
        28	England    |  29	Poland          |  30	Senegal
        31	Colombia   |  32	Japan"

  input = gets.chomp
  input = input.to_i


  # binding.pry

  users_team = Team.find_by team_id: input
   @@user_t_name = users_team.country

  puts "Nice, so you like to see the latesed stats on #{@@user_t_name}?"

  input = gets.chomp


    # users_team.get_match_statistics
  # input = gets.chomp
    users_team.get_match_stats

    users_team.get_events
    # binding.pr
end
