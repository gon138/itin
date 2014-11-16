class AddIndex < ActiveRecord::Migration
  def change
  	add_index :partners_waypoints, :partner_id
  	add_index :partners_waypoints, :waypoint_id
  end
end
