class AddLocationAndSalaryToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :location, :string
  	add_column :jobs, :salarymin, :integer
  	add_column :jobs, :salarymax, :integer
  end
end
