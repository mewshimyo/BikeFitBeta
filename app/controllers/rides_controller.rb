class RidesController < ApplicationController
  def all
  end

  def recent
  end

  def show
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

    @ride_id = Ride.last.id

    #redirect tag to redirect to rides/show/ride_id



  end
  def ride_params
    params.require(:ride).permit(:user_id, :date, :distance, :elevation, :time, :strava_link)
  end
end

