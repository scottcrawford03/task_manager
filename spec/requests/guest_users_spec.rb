require 'rails_helper'

RSpec.describe "GuestUsers", type: :request do
  describe "GET /" do
    it "visits the root path" do
      get root_path
      expect(response).to have_http_status(200)
    end

    it "visits the root path and a user sees task lists" do
      visit root_path
      expect(page).to have_content("TaskLists")
    end
  end

  describe "Creating a new task list" do
    it "can create a new task list" do
      visit root_path
      click_link_or_button "Create New TaskList"
      expect(current_path).to eq(new_task_list_path)

      fill_in "task_list[title]", with: "Chores"
      click_link_or_button "Create TaskList"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Chores")
    end
  end

  describe "Creating a new task on a task list" do
    before do
      visit root_path
      click_link_or_button "Create New TaskList"
      fill_in "task_list[title]", with: "Chores"
      click_link_or_button "Create TaskList"

      click_link_or_button "Chores" 
      click_link_or_button "Create Task"
      fill_in "task[title]", with: "Mow"
      fill_in "task[description]", with: "The grass won't cut itself"
      fill_in "task[due_date]", with: Date.today
      click_link_or_button "Create Task"
    end

    it "can create a new task" do
      expect(page).to have_content("Mow")
      expect(page).to have_content("The grass won't cut itself")
      expect(page).to have_content(Date.today)
    end

    it "can hide a task" do
      click_link_or_button "Complete Task"
      visit root_path
      click_link_or_button "Chores"

      expect(page).not_to have_content("Mow")
    end
  end
end
