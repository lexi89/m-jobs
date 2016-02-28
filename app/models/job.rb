class Job < ActiveRecord::Base
	validates :title, presence: true
	validates :salarymin, presence: true, numericality: { greater_than: 1, less_than: :salarymax}
	validates :salarymax, presence: true, numericality: { greater_than: 1, less_than: 999000}
	belongs_to :company
	has_many :jobcategories
	has_many :categories, through: :jobcategories

	def country_name
	    country = ISO3166::Country[location]
	    country.translations[I18n.locale.to_s] || country.name
	end

end
