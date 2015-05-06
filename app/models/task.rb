class Task < ActiveRecord::Base
  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => 'CageDali.jpg'
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  belongs_to :task_list
  before_create :make_incomplete

  def make_incomplete
    self.status = "incomplete"
  end

  def delete_attachment
    self.attachment = nil
    self.save
  end
end
