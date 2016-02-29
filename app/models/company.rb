class Company < ActiveRecord::Base
	require "csv"
	require 'open-uri'

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

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			company_hash = {:mission => row["mission"], :description => row["description"],
											:remote_logo_url => row["logo"], :name => row["name"], :location => row["location"],
											:employees => row["employees"], :url => row["url"]}
			company = Company.where(id: company_hash[:id])
			if company.count == 1
				company.first.update_attributes(company_hash)
			else
				Company.create(company_hash)
			end
		end

	end
end
