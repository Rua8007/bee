class AddCatToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cat, :string
  end
end
