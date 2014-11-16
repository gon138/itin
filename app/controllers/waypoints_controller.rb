class WaypointsController < ApplicationController
	before_action :find_waypoint, except: [:index, :new, :create]

	def index
		@waypoints = Waypoint.all
	end

	def show
	end

	def new
		@itinerary = Itinerary.find(params[:itinerary_id])
		@waypoint = Waypoint.new
	end

	def edit
		@itinerary = Itinerary.find(params[:itinerary_id])
		@partners = Partner.all
	end

	def create
		@waypoint = Waypoint.new(waypoint_params.merge(itinerary_id: params[:itinerary_id]))
		if @waypoint.save
		  flash[:success] = "Waypoint successfully created"
		  redirect_to root_path
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
	end

	def update
		params[:partners] ||= []
		@waypoint.partners = []
		@waypoint.partners << Partner.find(params[:waypoint][:partners])
		if @waypoint.update_attributes(waypoint_params.merge(itinerary_id: params[:itinerary_id]))
		  flash[:success] = "Waypoint was successfully updated"
		  redirect_to root_path
		else
		  flash[:error] = "Something went wrong"
		  render 'edit'
		end
	end

	def destroy
		if @waypoint.destroy
			flash[:success] = "Waypoint was successfully deleted"
			redirect_to root_path
		else
			flash[:error] = "Something went wrong"
			redirect_to root_path
		end
	end

	private

		def find_waypoint
			@waypoint = Waypoint.find(params[:id])
		end

		def waypoint_params
			params.require(:waypoint).permit(:location, :name, :date)
		end

end