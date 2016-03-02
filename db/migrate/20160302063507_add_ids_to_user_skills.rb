class AddIdsToUserSkills < ActiveRecord::Migration
  def change
    add_column :user_skills, :user_id, :integer
    add_column :user_skills, :skill_id, :integer
  end
end
