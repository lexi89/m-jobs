class Company < ActiveRecord::Base
	mount_uploader :logo, LogoUploader
	has_many :jobs
	has_many :companyindustries
	has_many :industries, through: :companyindustries
	accepts_nested_attributes_for :industries
end
