class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :name, :start_date, :dead_line, :hours_worked, :expected_hours, presence: true
end
