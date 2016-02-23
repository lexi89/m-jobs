class ChangeEmployeesForCompanies < ActiveRecord::Migration
  def change
  		change_column :companies, :employees, :string
  end
end
