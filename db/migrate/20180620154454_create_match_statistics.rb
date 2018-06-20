class CreateMatchStatistics < ActiveRecord::Migration[5.0]
  def change
    create_table :match_statistics do |t|
      
      t.string   :country
      t.integer  :team_id
      t.integer  :match_id
      t.integer  :attempts_on_goal
      t.integer  :on_target
      t.integer  :off_target
      t.integer  :blocked
      t.integer  :woodwork
      t.integer  :corners
      t.integer  :offsides
      t.integer  :ball_possession
      t.integer  :pass_accuracy
      t.integer  :num_passes
      t.integer  :passes_completed
      t.integer  :distance_covered
      t.integer  :balls_recovered
      t.integer  :tackles
      t.integer  :clearances
      t.integer  :yellow_cards
      t.integer  :red_cards
      t.integer  :fouls_committed
    end
  end
end
