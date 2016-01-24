class EventsController < ApplicationController
	def index
		@events = Event.paginate(:page => params[:page], :per_page => 20)
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			@events = Event.paginate(:page => params[:page], :per_page => 20)
			@eventid = @event.id
			respond_to do |format|
				format.html{redirect_to root_path}
				format.js 
			end
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@eventid = params[:id]
		@event.destroy
	end

	def destroyathlete
		session[:return_to] ||= request.referer
		@tran = Tran.find_by(tran_params)
		if @tran.destroy
			redirect_to session.delete(:return_to)
		end
	end

	def show
	end

	def getathlete
		@athletes = Athlete.paginate(:page => params[:page], :per_page => 15)
		
	end

	def createathlete
		session[:return_to] ||= request.referer
		@tran = Tran.new(tran_params)
		if @tran.save
			redirect_to session.delete(:return_to)
		end
	end

	private
		def event_params
			params.require(:event).permit(:name)
		end

		def tran_params
			params.require(:tran).permit(:athlete_id, :event_id)
		end
end
