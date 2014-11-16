class Itinerary < ActiveRecord::Base
	has_many :waypoints
	has_many :partners, through: :waypoints
end
