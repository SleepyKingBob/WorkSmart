class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true
  self.bool_field = false if self.bool_field.nil?
end
