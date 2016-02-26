class AddIndexForInterests < ActiveRecord::Migration
  def change
  	add_index :interests, [:follower_id, :followed_id]
  end
end
