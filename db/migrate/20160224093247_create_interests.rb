class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :interests, :follower_id
    add_index :interests, :followed_id
    add_index :interests, [:follower_id, :followed_id], unique: true
  end
end
