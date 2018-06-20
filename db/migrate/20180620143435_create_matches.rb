class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
    end
  end
end
