class AddMakingToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :making, :string
  end
end
