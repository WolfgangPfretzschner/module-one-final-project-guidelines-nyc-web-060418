def welcome
  puts "Welcome to the 2018 FIFA WorldCup Live Database"
  puts "================================================="
end

def country_list
  puts "What country are you interested in, please pick by number."
  puts "====================================================="
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

end

def getting_country_from_user(answer)
  @@users_team = Team.find_by team_id: answer
  @@user_t_name = @@users_team.country
  puts "================================================"
  puts "You picked #{@@user_t_name}!"
end

def input
  input = gets.chomp

end


def call_stats
    @@users_team.get_match_stats
end

def call_events
  @@users_team.get_events
end

def exit_message
  puts "Thank you and viva #{@@user_t_name}!"
end
