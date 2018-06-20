class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :team_id
      t.string :country
      t.string :fifa_code
      t.integer :group_id
      t.string :group_letter
    end

  end
end
