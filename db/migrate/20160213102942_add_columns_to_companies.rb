class AddColumnsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :mission, :string
    add_column :companies, :description, :string
    add_column :companies, :logo, :string
  end
end
