class AddCreatorIdToBugs < ActiveRecord::Migration
  def change
  	add_column :bugs, :creator_id, :integer
  end
end
