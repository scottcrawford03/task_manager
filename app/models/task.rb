class Task < ActiveRecord::Base
  belongs_to :task_list
  before_create :make_incomplete

  def make_incomplete
    self.status = "incomplete"
  end
end
