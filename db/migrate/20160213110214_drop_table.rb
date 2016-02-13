class DropTable < ActiveRecord::Migration
  def change
  	drop_table :views
  end
end
