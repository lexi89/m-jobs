class CreateCompanyIndustry < ActiveRecord::Migration
  def change
    create_table :company_industries do |t|
      t.references :company, index: true, foreign_key: true
      t.references :industry, index: true, foreign_key: true
    end
  end
end
