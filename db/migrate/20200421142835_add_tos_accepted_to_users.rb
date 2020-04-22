class AddTosAcceptedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tos_accepted, :datetime
  end
end
