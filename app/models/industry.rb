class Industry < ActiveRecord::Base
	has_many :companyindustries
	has_many :companies, through: :companyindustries
end
