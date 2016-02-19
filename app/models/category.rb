class Category < ActiveRecord::Base
	has_many :jobcategories
	has_many :jobs, through: :jobcategories
end
