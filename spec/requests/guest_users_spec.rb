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
    it "can create a new task" do
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
      expect(page).to have_content("Mow")
      expect(page).to have_content("The grass won't cut itself")
      expect(page).to have_content(Date.today)
    end

    it "can hide a task" do
      task_list = TaskList.create(title: "Saturday")
      task = Task.create(title: "Poo Patrol", 
                         description: "Get the Poo", 
                         due_date: Date.today,
                         status: 'incomplete')
      task_list.tasks << task
      visit task_list_path(task_list)
      expect(page).to have_content("Poo Patrol")


      within('.all-tasks') do
        click_link_or_button "Complete Task"
      end 
      expect(current_path).to eq(task_list_path(task_list))
    end
  end

  describe "Updating and task on a task list" do
    it "can update a task" do
      task_list = TaskList.create(title: "Saturday")
      task = Task.create(title: "Poo Patrol", 
                         description: "Get the Poo", 
                         due_date: Date.today,
                         status: 'incomplete')
      task_list.tasks << task
      visit task_list_path(task_list)

      within('.all-tasks') do
        click_link_or_button('Edit Task')
      end

      fill_in "task[title]", with: "Mow"
      fill_in "task[description]", with: "Mow"
      fill_in "task[due_date]", with: Date.today 
      click_link_or_button 'Update Task'
      
      expect(page).to have_content('Mow')
    end
  end

  describe "Updating a task list" do
    it "can update a task list" do
      task_list = TaskList.create(title: "Yolo")
      visit root_path
      
      expect(page).to have_content("Yolo")
      within('.task-lists') do
        click_link_or_button "Edit TaskList"
      end
      
      fill_in "task_list[title]", with: "The Wild Side"
      click_link_or_button "Update TaskList"
      expect(page).to have_content("The Wild Side")
    end
  end

  describe "Looking at archived jobs" do
    it "can look at archived tasklists" do
      task_list = TaskList.create(title: "Hello", archived: true) 
      visit root_path

      click_link_or_button "Archived TaskLists"

      expect(page).to have_content("Hello")
    end
  end
end
