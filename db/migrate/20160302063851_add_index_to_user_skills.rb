class AddIndexToUserSkills < ActiveRecord::Migration
  def change
    add_index :userskills, :user_id
    add_index :userskills, :skill_id
  end
end
