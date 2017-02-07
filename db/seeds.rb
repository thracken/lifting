# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jeff = User.create(name: "Jeff", email: "jeff@example.org", password: "password12", password_confirmation: "password12", admin: true, created_at: Time.now, updated_at: Time.now)
jake = User.create(name: "Jake", email: "jake@example.org", password: "password12", password_confirmation: "password12", admin: false, created_at: Time.now, updated_at: Time.now)

phraks = Routine.create(name: "Phrak's Grey Skull LP", user_id: jeff.id)
jeff.active_routine_id = phraks.id

ExerciseGroup.create(name: "Day A", routine_id: 1)
group1 = ExerciseGroup.find_by(:name => "Day A")
group1.exercises.create(name: "Bench Press", weight: 45, weight_increment: 2.5, reps_goal: 5, sets_goal: 3, time_between_sets: 90, created_at: Time.now, updated_at: Time.now)
group1.exercises.create(name: "Squat", weight: 45, weight_increment: 5, reps_goal: 5, sets_goal: 3, time_between_sets: 90, created_at: Time.now, updated_at: Time.now)
group1.exercises.create(name: "Chinup", weight: 45, weight_increment: 2.5, reps_goal: 5, sets_goal: 3, time_between_sets: 90, created_at: Time.now, updated_at: Time.now)

ExerciseGroup.create(name: "Day B", routine_id: 1)
group2 = ExerciseGroup.find_by(:name => "Day B")
group2.exercises.create(name: "Overhead Press", weight: 45, weight_increment: 2.5, reps_goal: 5, sets_goal: 3, time_between_sets: 90, created_at: Time.now, updated_at: Time.now)
group2.exercises.create(name: "Barbell Rows", weight: 45, weight_increment: 2.5, reps_goal: 5, sets_goal: 3, time_between_sets: 90, created_at: Time.now, updated_at: Time.now)
group2.exercises.create(name: "Deadlift", weight: 45, weight_increment: 5, reps_goal: 5, sets_goal: 3, time_between_sets: 90, created_at: Time.now, updated_at: Time.now)

Routine.create(name: "Starting Strength", user_id: jeff.id)
Routine.create(name: "Strong Lifts 5x5", user_id: jake.id)

session = WorkoutSession.create(date: Time.now, user_id: jeff.id)
