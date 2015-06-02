class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :title
      t.date :deadline
      t.string :description
      t.string :typ
      t.string :status

      t.timestamps null: false
    end
  end
end
