class Event < ActiveRecord::Base

  belongs_to :match

  def self.create_events_data
    self.destroy_all
    Match.destroy_all
    MatchStatistic.destroy_all
    all_events = RestClient.get('http://worldcup.sfg.io/matches/')
    events_arr = JSON.parse(all_events)
    # binding.pry
    events_arr.each do |co|
      # binding.pry
      temp_match = Match.create({
        home_team: co["home_team"]["country"],
        away_team: co["away_team"]["country"]
        })
      if co["home_team"]
        team_h = co["home_team"]["country"]
      end
        if co["away_team"]
        team_a = co["away_team"]["country"]
      end
        co.each do |key, val|
          if key == "home_team_statistics" && val != nil
            # binding.pry
            MatchStatistic.create({
              match_id: temp_match["id"],
              country: team_h,
              attempts_on_goal: val["attempts_on_goal"],
              on_target: val["on_target"],
              off_target: val["off_target"],
              blocked: val["blocked"],
              woodwork: val["woodwork"],
              corners: val["corners"],
              offsides: val["offsides"],
              ball_possession: val["ball_possession"],
              pass_accuracy: val["pass_accuracy"],
              num_passes: val["num_passes"],
              passes_completed: val["passes_completed"],
              distance_covered: val["distance_covered"],
              balls_recovered: val["balls_recovered"],
              tackles: val["tackles"],
              clearances: val["clearances"],
              yellow_cards: val["yellow_cards"],
              red_cards: val["red_cards"],
              fouls_committed: val["fouls_committed"] })

            elsif key == "home_team_statistics" && val == nil
              MatchStatistic.create({
                country: "TBD"})
            end

            if key == "away_team_statistics" && val != nil
              # binding.pry
              MatchStatistic.create({
                match_id: temp_match["id"],
                country: team_a,
                attempts_on_goal: val["attempts_on_goal"],
                on_target: val["on_target"],
                off_target: val["off_target"],
                blocked: val["blocked"],
                woodwork: val["woodwork"],
                corners: val["corners"],
                offsides: val["offsides"],
                ball_possession: val["ball_possession"],
                pass_accuracy: val["pass_accuracy"],
                num_passes: val["num_passes"],
                passes_completed: val["passes_completed"],
                distance_covered: val["distance_covered"],
                balls_recovered: val["balls_recovered"],
                tackles: val["tackles"],
                clearances: val["clearances"],
                yellow_cards: val["yellow_cards"],
                red_cards: val["red_cards"],
                fouls_committed: val["fouls_committed"] })

              elsif key == "away_team_statistics" && val == nil
                MatchStatistic.create({
                  country: "TBD"})
              end

          if key == "home_team_events"
            val.each do |el|
              self.create({
                match_id: temp_match["id"],
                type_of_event: el["type_of_event"],
                player: el["player"],
                country: team_h})
            end
          end
          if key == "away_team_events"
            val.each do |el|
              self.create({
                match_id: temp_match["id"],
                type_of_event: el["type_of_event"],
                player: el["player"],
                country: team_a})

            end
          end
        end
      end
    end
end
