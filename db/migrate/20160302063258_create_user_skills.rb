class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|

      t.timestamps null: false
    end
  end
end
