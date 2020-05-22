# frozen_string_literal: true

# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
=begin
      insert into tests_users (test_id, user_id)
     Values
     (2,1),
     (1,1),
     (3,1),
     (4,2)
     ;
=end
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user3 = User.create(email: 'creator@mail.ru')
category1 = Category.create(title: 'WEB')
category2 = Category.create(title: 'SQL')
category3 = Category.create(title: 'Programming')
test1 = Test.create(title: 'Ruby', category_id: category3.id)
test2 = Test.create(title: 'Rails', category_id: category3.id)
test3 = Test.create(title: 'Postgres', category_id: category2.id)
test4 = Test.create(title: 'HTTP', category_id: category1.id, creator_id: user3.id)
question1 = Question.create(body: 'What is HTTP?', test_id: test4.id)
question2 = Question.create(body: 'What is Migration?', test_id: test2.id)
question3 = Question.create(body: 'What is Rails Model?', test_id: test2.id)
question4 = Question.create(body: 'What is Instance Methods?', test_id: test1.id)
question5 = Question.create(body: 'How to describe table in Postgres?', test_id: test3.id)
question6 = Question.create(body: 'What is Class Methods', test_id: test1.id)
answer1 = Answer.create(body: 'Methods of Class Object', question_id: question4.id)
answer2 = Answer.create(body: 'Methods of the current Class', question_id: question6.id)
user1 = User.create(email: 'maksim@yandex.ru')
user2 = User.create(email: 'andrey@mail.ru')


