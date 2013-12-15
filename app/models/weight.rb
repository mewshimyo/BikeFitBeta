class Weight < ActiveRecord::Base

	#Model Layout
	#------------
	#weight (float) is the user's weight
	#date (date) is the date the weight was recorded
	belongs_to :user
	validates :weight, presence: true, numericality: true
	validates_with NotFuture
end

class NotFuture < ActiveModel::Validator #Validates entered date is not in the future
	def validate(record)
		#code goes here, yo!
	end
end