class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :home_municipality, :string
    add_column :users, :phonenumber, :string
  end
end
