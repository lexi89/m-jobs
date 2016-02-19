class RenameCompanyIndustries < ActiveRecord::Migration
  def change
  	rename_table :company_industries, :companyindustries
  end
end
