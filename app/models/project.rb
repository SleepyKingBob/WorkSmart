class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, :start_date, :dead_line, :hours_worked, :expected_hours, presence: true

  def start_time
    self.my_related_model.start_date #Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

end
