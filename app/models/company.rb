class Company < ActiveRecord::Base
	mount_uploader :logo, LogoUploader
	has_many :jobs
	has_many :companyindustries
	has_many :industries, through: :companyindustries
	accepts_nested_attributes_for :industries
	has_many :interests, foreign_key: "followed_id", dependent: :destroy
	has_many :followers, through: :interests
	searchable do 
		text :name, :boost => 5
		text :industries do
			industries.map { |industry| industry.name }
		end
	end

	def country_name
	    country = ISO3166::Country[location]
	    country.translations[I18n.locale.to_s] || country.name
	end
end
