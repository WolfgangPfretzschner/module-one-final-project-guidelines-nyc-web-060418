class Team < ActiveRecord::Base

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
end
