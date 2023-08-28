class Schedule < ApplicationRecord
  belongs_to :user
  validates :start_time, :end_time, :lunch_break, presence: true
end
