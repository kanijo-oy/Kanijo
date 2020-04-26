class AddPersonsToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :persons, :string
  end
end
