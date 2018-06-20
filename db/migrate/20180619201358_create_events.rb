class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :match_id
      t.string :type_of_event
      t.string :player
      t.string :country
    end
  end
end
