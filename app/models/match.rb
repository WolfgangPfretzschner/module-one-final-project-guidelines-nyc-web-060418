class Match < ActiveRecord::Base

  has_many :events
  has_many :match_statistics

  def self.find_match_with_most_goals_scored
    

  end




end
