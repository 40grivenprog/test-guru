# This file should contain all the record creation needed to seed the database with its default values.
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
		Category.create(title:'WEB')
		Category.create(title:'SQL')
		Category.create(title:'Programming')
		Test.create(title: 'Ruby',categorie_id: 3)
		Test.create(title: 'Rails', categorie_id: 3)
		Test.create(title: 'Postgres', categorie_id: 2)
		Test.create(title: 'HTTP', categorie_id: 1)
		Question.create(body: 'What is HTTP?', test_id: 4)
		Question.create(body: 'What is Migration?', test_id: 2)
		Question.create(body: 'What is Rails Model?', test_id: 2)
		Question.create(body: 'What is Instance Methods?', test_id: 1)
		Question.create(body: 'How to describe table in Postgres?', test_id: 3)
		Question.create(body: 'What is Class Methods', test_id: 1)
		Answer.create(body: 'Methods of Class Object', question_id: 4)
		Answer.create(body: 'Methods of the current Class', question_id: 6)
		User.create(email: 'maksim@yandex.ru')
		User.create(email: 'andrey@mail.ru')
