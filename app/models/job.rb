class Job < ActiveRecord::Base
	belongs_to :company
	has_many :jobcategories
	has_many :categories, through: :jobcategories

	def country_name
	    country = ISO3166::Country[location]
	    country.translations[I18n.locale.to_s] || country.name
	end
	
end
