class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :icon
      t.string :address1
      t.string :postalcode
      t.string :city
      t.integer :num_people

      t.timestamps
    end
  end
end
