class RenameUserSkills < ActiveRecord::Migration
  def change
    rename_table :user_skills, :userskills
  end
end
