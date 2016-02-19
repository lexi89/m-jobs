class RenameJobCategoriesToJobCategories < ActiveRecord::Migration
  def change
  	rename_table :job_categories, :jobcategories
  end
end
