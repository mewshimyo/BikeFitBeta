class Ride < ActiveRecord::Base

	#Model Layout
	#---------------
	#user_id (integer) links to field on User
	#date (date) is for date of the ride
	#distance (float) is for distance of ride (in miles) (optional if time is present)
	#time (integer) is for distance of ride (in minutes) (optional if distance is present)
	#elevation (integer) is for elevation gain on ride (in feet) (optional)
	#strava_link (string) is for a strava link (optional)
	#type (boolean) is false for road (default) and true for MTB
	belongs_to :user

	validates :user_id, numericality: { only_integer: true }
	validates_with NotFuture #Ensure date is not in the future
	validates_with DistanceOrTimePresent #Ensure either Distance or Time are present
	validates :elevation, numericality :true
end


class NotFuture < ActiveModel::Validator #Validates entered date is not in the future
	def validate(record)
		#code goes here, yo!
	end
end

class DistanceOrTimePresent < ActiveModel::Validator #Validates that at least 1 of (distance|time) is present
	def validate(record)
		#code goes here, yo!
	end
end

