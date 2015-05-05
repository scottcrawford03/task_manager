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
end
