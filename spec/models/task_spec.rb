require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "The Task" do
    before do
      @task = Task.new(title: "Mow", 
                      description: "Do it",
                      due_date: Date.today)
    end
    
    it "has a title" do
      expect(@task.title).to eq("Mow")
    end

    it "has a description" do
      expect(@task.description).to eq("Do it")
    end

    it "has a status" do
      expect(@task.status).not_to eq("incomplete")
      @task.save
      expect(@task.status).to eq('incomplete')
    end

    it "has a due date" do
      expect(@task.due_date).to eq(Date.today)
    end

    it "has a task list" do
      task_list = TaskList.new(title: "Chores")
      @task.task_list = task_list
      expect(@task.task_list).to eq(task_list)
    end
  end
end
