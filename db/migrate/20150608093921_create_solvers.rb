class CreateSolvers < ActiveRecord::Migration
  def change
    create_table :solvers do |t|
    	t.integer :user_id
        t.integer :bug_id

      t.timestamps null: false
    end
  end
end
