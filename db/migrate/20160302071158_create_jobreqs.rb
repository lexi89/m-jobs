class CreateJobreqs < ActiveRecord::Migration
  def change
    create_table :jobreqs do |t|
      t.integer :job_id
      t.integer :req_id

      t.timestamps null: false
    end
    add_index :jobreqs, :job_id
    add_index :jobreqs, :req_id
  end
end
