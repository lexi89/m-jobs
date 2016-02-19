class Job < ActiveRecord::Base
	belongs_to :company
	has_many :jobcategories
	has_many :categories, through: :jobcategories
end
