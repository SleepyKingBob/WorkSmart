# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Deleting all Projects..."
Project.destroy_all
Schedule.destroy_all

puts "Creating New Projects..."
project1 = Project.create(
  name: "Build Web App",
  start_date: Date.new(2023, 8, 24),
  dead_line: Date.new(2023, 9, 10),
  expected_hours: 50,
  user_id: User.last.id
)
Task.create(name: "Setup Server", project_id: project1.id)
Task.create(name: "Design Website", project_id: project1.id)
Task.create(name: "Debug", project_id: project1.id)

project2 = Project.create(
  name: "Setup Meeting",
  start_date: Date.new(2023, 8, 24),
  dead_line: Date.new(2023, 8, 26),
  expected_hours: 2,
  user_id: User.last.id
)
Task.create(name: "Book Room", project_id: project2.id)
Task.create(name: "Prep Slides", project_id: project2.id)
Task.create(name: "RSVP Attendence", project_id: project2.id)

project3 = Project.create(
  name: "World Domination",
  start_date: Date.new(2023, 8, 24),
  dead_line: Date.new(2024, 1, 1),
  expected_hours: 100,
  user_id: User.last.id
)
Task.create(name: "Replace World leaders with idiots", project_id: project3.id)
Task.create(name: "Cripple the Economy", project_id: project3.id)
Task.create(name: "Get a bagel", project_id: project3.id)

Schedule.create!(user_id: User.last.id, start_time: Time.now, lunch_break: Time.now + 5400, end_time: Time.now + 15400)

puts "Finished!"
