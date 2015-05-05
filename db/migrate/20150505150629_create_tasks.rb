class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.references :task_list, index: true, foreign_key: true
      t.string :status
      t.date :due_date

      t.timestamps null: false
    end
  end
end
