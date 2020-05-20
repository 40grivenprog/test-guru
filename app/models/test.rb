class Test < ApplicationRecord
	def self.test_by_categories(categorie_name)
		binding.pry
		categorie = Category.find_by(title: categorie_name)
		Test.where('categorie_id = ?', categorie.id).order(title: :desc).pluck(:title)
	end
end
