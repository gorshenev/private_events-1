class EventsController < ApplicationController

	def index
		@options = ["Upcoming Events", "Past Events"]
		@upcoming = Event.where("eventDate > ?", Time.now)
	end

	def show
		@event = Event.find_by(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.build(event_params())
		if @event.save
			flash[:notice] = "Event Created"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end


	private

	def event_params
		params.require(:event).permit(:title, :description, :location, :eventDate, :startTime)
	end
end