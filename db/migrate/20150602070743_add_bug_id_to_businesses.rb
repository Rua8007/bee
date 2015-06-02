class AddBugIdToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :bug_id, :integer
  end
end
