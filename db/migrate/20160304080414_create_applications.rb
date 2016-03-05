class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :applicant_id
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
