# frozen_string_literal: true

class Test < ApplicationRecord
<<<<<<< HEAD
  def self.test_by_categories(category_name)
    Test.joins('JOIN categories on tests.category_id = categories.id').where('categories.title = ?', category_name).order(title: :desc).pluck(:title)
  end
=======
	def self.test_by_categories(categorie_name)
		binding.pry
		categorie = Category.find_by(title: categorie_name)
		Test.where('categorie_id = ?', categorie.id).order(title: :desc).pluck(:title)
	end
>>>>>>> 468262be8c7de06264401f6979b82bd313741971
end
