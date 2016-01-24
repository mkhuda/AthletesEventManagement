class AthletesController < ApplicationController
	

	def index
		@athletes = Athlete.paginate(:page => params[:page], :per_page => 20)
	end

	def new
		@athlete = Athlete.new
	end

	def create
		@athlete = Athlete.new(athlete_params)
		if @athlete.save
			@athletes = Athlete.paginate(:page => params[:page], :per_page => 20)
			@athleteid = @athlete.id
			respond_to do |format|
				format.html{redirect_to root_path}
				format.js 
			end
		end
	end

	def destroy
		@athlete = Athlete.find(params[:id])
		@athleteid = params[:id]
		@athlete.destroy
	end

	private
		def athlete_params
			params.require(:athlete).permit(:name, :city)
		end
end
