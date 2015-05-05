class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.string :title
      t.boolean :archived, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
