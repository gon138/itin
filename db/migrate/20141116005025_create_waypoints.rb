class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.string :location
      t.string :name
      t.date :date
      t.references :itinerary, index: true

      t.timestamps
    end
  end
end
