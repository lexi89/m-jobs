class AddLocationAndEmployeesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :location, :string
    add_column :companies, :employees, :integer
  end
end
