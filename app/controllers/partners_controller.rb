class PartnersController < ApplicationController
	before_action :find_partner, except: [:index, :new, :create]

	def index
		@partners = Partner.all
	end

	def show
	end

	def new
		@partner = Partner.new
	end

	def edit
	end

	def create
		@partner = Partner.new(partner_params)
		if @partner.save
		  flash[:success] = "Partner successfully created"
		  redirect_to root_path
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
	end

	def update
		if @partner.update_attributes(partner_params)
		  flash[:success] = "Partner was successfully updated"
		  redirect_to root_path
		else
		  flash[:error] = "Something went wrong"
		  render 'edit'
		end
	end

	def destroy
		if @partner.destroy
			flash[:success] = "Partner was successfully deleted"
			redirect_to root_path
		else
			flash[:error] = "Something went wrong"
			redirect_to root_path
		end
	end

	private

		def find_partner
			@partner = Partner.find(params[:id])
		end

		def partner_params
			params.require(:partner).permit(:name, :gender)
			
		end

end