# frozen_string_literal: tru
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Answer.delete_all
# Question.delete_all
# User.delete_all
# Test.delete_all
# Category.delete_all
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category1 = Category.create(title: 'WEB')
category2 = Category.create(title: 'SQL')
category3 = Category.create(title: 'Programming')


test1 = Test.create(title: 'Ruby', category_id: category3.id)
test2 = Test.create(title: 'Rails', category_id: category3.id, level: 3)
test3 = Test.create(title: 'Postgres', category_id: category2.id, level: 2)
test4 = Test.create(title: 'HTTP', category_id: category1.id, level: 6)



question1 = Question.create(body: 'What is HTTP?', test_id: test4.id)
question2 = Question.create(body: 'What is Migration?', test_id: test2.id)
question3 = Question.create(body: 'What is Rails Model?', test_id: test2.id)
question4 = Question.create(body: 'What is Instance Methods?', test_id: test1.id)
question5 = Question.create(body: 'How to describe table in Postgres?', test_id: test3.id)
question6 = Question.create(body: 'What is Class Methods', test_id: test1.id)


answer1 = Answer.create(body: 'Methods of Class Object', question_id: question4.id, correct: true)
answer2 = Answer.create(body: 'Methods of the current Class', question_id: question6.id)
answer3 = Answer.create(body: 'Class methods', question_id: question4.id)
answer4 = Answer.create(body: 'HTML methods', question_id: question4.id)
answer5 = Answer.create(body: 'JS methods', question_id: question4.id)


user1 = User.create(email: 'maksim@yandex.ru')
user2 = User.create(email: 'andrey@mail.ru')
=begin
tests_user1 = TestPassage.create(user_id: user1.id, test_id: test1.id)
tests_user2 = TestPassage.create(user_id: user1.id, test_id: test2.id)
tests_user3 = TestPassage.create(user_id: user1.id, test_id: test3.id)
tests_user4 = TestPassage.create(user_id: user2.id, test_id: test1.id)
=end