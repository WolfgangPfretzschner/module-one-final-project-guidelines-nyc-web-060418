class Team < ActiveRecord::Base

  def self.create_team_data
    self.destroy_all
    all_team = RestClient.get('http://worldcup.sfg.io/teams/')
    teams_arr = JSON.parse(all_team)
    teams_arr.each do |co|
      # binding.pry
      self.create({api_id: co["id"], country: co["country"], alternate_name: co["alternate_name"], fifa_code: co["fifa_code"] , group_id: co["group_id"], group_letter: co["group_letter"] })
      nil

    end
  end






end
