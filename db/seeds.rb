# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
categories = Category.create([
  {title: 'Web development'},
  {title: 'Mobile development'},
  {title: 'Game development'}])

tests = Test.create([
  {title: 'Test Ruby', category_id: 1},
  {title: 'Test Kotlin', level: 1, category_id: 2},
  {title: 'Test C#', level: 2, category_id: 3}])

questions = Question.create([
  {body: 'question 1', test_id: 1}])

answers = Answer.create([
  {body: 'answer 1', correct: true, question_id: 1},
  {body: 'answer 2', question_id: 1}])

user = Users.create([
  {name: 'Adam'}])
