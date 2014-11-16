class ItinerariesController < ApplicationController
	before_action :find_itinerary, except: [:index, :new, :create]

	def index
		@itineraries = Itinerary.all
		@partners = Partner.all.order(name: :desc)
	end

	def show
	end

	def new
		@itinerary = Itinerary.new
	end

	def edit
		@itinerary = Itinerary.find(params[:id])
	end

	def create
		@itinerary = Itinerary.new(itinerary_params)
		if @itinerary.save
		  flash[:success] = "Itinerary successfully created"
		  redirect_to root_path
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
	end

	def update
		if @itinerary.update_attributes(itinerary_params)
		  flash[:success] = "Itinerary was successfully updated"
		  redirect_to root_path
		else
		  flash[:error] = "Something went wrong"
		  render 'edit'
		end
	end

	def destroy
		if @itinerary.destroy
			flash[:success] = "Itinerary was successfully deleted"
			redirect_to root_path
		else
			flash[:error] = "Something went wrong"
			redirect_to root_path
		end
	end

	private

		def find_itinerary
			@itinerary = Itinerary.find(params[:id])
		end

		def itinerary_params
			params.require(:itinerary).permit(:name, :origin, :destination, :departure, :return)
		end

end