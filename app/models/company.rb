class Company < ActiveRecord::Base
	has_many :jobs
	has_many :companyindustries
	has_many :industries, through: :companyindustries
	accepts_nested_attributes_for :industries
end
