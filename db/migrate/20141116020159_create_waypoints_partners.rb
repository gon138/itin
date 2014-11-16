class CreateWaypointsPartners < ActiveRecord::Migration
  def change
    create_table :partners_waypoints, id: false do |t|
    	t.integer :waypoint_id
    	t.integer :partner_id
    end
  end
end
