class RemoveIndexInterestsUnique < ActiveRecord::Migration
  def change
  	remove_index :interests, name: "index_interests_on_follower_id_and_followed_id"
  end
end
