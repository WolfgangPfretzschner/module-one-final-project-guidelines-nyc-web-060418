class AddColumnAlternateName < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :alternate_name, :string
    add_column :teams, :api_id, :integer
  end
end
