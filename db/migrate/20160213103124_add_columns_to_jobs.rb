class AddColumnsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :title, :string
    add_column :jobs, :description, :string
    add_column :jobs, :salary, :integer
    add_column :jobs, :requirements, :string
    add_column :jobs, :link, :string
  end
end
