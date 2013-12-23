class RidesController < ApplicationController
  def all
  end

  def recent
  end

  def view
  end

  def new
      @ride= Ride.new
  end

  def edit
  end

  def delete
  end

  def create
    @ride= Ride.new(ride_params)
    @ride.user_id = current_user.id
    @ride.save

    @ride_id = Ride.last.id #This is a terrible, terrible way to do this.

    redirect_to action: 'view', :id => @ride_id



  end
  def ride_params
    params.require(:ride).permit(:user_id, :date, :distance, :elevation, :time, :strava_link)
  end
end

