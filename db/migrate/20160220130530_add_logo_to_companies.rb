class AddLogoToCompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :logo, :url
  end
end
