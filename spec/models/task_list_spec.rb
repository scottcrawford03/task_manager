require 'rails_helper'

RSpec.describe TaskList, type: :model do
  describe "The Task List" do
    it "has a title" do
      task_list = TaskList.new(title: "Chores")
      expect(task_list.title).to eq("Chores")
    end

    it "has starts out unarchived" do
      task_list = TaskList.new
      expect(task_list.archived).to eq(false)
    end

    it "has a user" do
      task_list = TaskList.new
      user = User.new
      task_list.user = user
      expect(task_list.user).to eq(user)
    end
  end
end
