class Team < ActiveRecord::Base
  # self.primary_key = 'match_id'


  has_many :matches
  has_many :match_statistics, through: :matches
  has_many :events, through: :matches


  @@user_t_name = nil

  def self.create_team_data

    self.destroy_all
    all_team = RestClient.get('http://worldcup.sfg.io/teams/')
    teams_arr = JSON.parse(all_team)
    teams_arr.each do |co|
      self.create({team_id: co["id"],
        country: co["country"],
        fifa_code: co["fifa_code"],
        group_id: co["group_id"],
        group_letter: co["group_letter"] })
    end
  end

  def connect_to_matches
    Match.all.select do |el|
      el.home_team == self.country || el.away_team == self.country
    end
  end

  def get_match_statistics
    self.connect_to_matches.map do |ma|
      @home = ma.home_team
      @way = ma.away_team
      # binding.pry
      ma.match_statistics
    end.flatten
  end

  def get_match_events
    self.connect_to_matches.map do |ma|
      @home = ma.home_team
      @way = ma.away_team
      # binding.pry
      ma.events
    end.flatten
  end


  def get_events
    puts "What statistic would you like to see?"
    puts ""
    puts "         attempts_on_goal  |   on_target       |   off_target
            blocked           |   woodwork        |   corners
            offsides          |   ball_possession |   pass_accuracy
            num_passes        |   passes_completed|   distance_covered
            balls_recovered   |   tackles         |   clearances
            yellow_cards      |   red_cards       |   fouls_committed"

    input = gets.chomp
    outp = input
    input = input.to_sym


    arr = []

     res = self.get_match_events.each do |te|
       # binding.pry
      if te.country == @@user_t_name
         arr << te[input]
         arr
         # binding.pry
      end
    end

    puts "============================================== "
    puts ""
    puts "#{@@user_t_name} has #{arr.length} #{outp}."
    puts ""
    puts ""
  end



  def get_single_country
    puts "What statistic would you like to see?"
    puts ""
    puts "         attempts_on_goal  |   on_target       |   off_target
            blocked           |   woodwork        |   corners
            offsides          |   ball_possession |   pass_accuracy
            num_passes        |   passes_completed|   distance_covered
            balls_recovered   |   tackles         |   clearances
            yellow_cards      |   red_cards       |   fouls_committed"

    input = gets.chomp
    outp = input
    input = input.to_sym


    added_result = 0

     res = self.get_match_statistics.each do |te|
      if te.country == @@user_t_name
        added_result += te[input]
      end
    added_result
    end

    puts "============================================== "
    puts ""
    puts "#{@@user_t_name} has #{added_result} #{outp}."
    puts ""
    puts ""
  end



end
