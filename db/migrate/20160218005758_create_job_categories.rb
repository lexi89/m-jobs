class CreateJobCategories < ActiveRecord::Migration
  def change
    create_table :job_categories do |t|
      t.references :job, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
