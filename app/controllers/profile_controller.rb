class ProfileController < ApplicationController
  def end

  end

  def blank
  end

  def view
  	@userid = Profile.where(:user_id => params[:id]).last.user_id
  	@firstname = Profile.where(:user_id => params[:id]).last.first_name
  	@lastname = Profile.where(:user_id => params[:id]).last.last_name
  	@birthday = Profile.where(:user_id => params[:id]).last.birthday
  end

  def edit
  	@profile = Profile.new
  end

  def edit_do
  	if Profile.where(:user_id => current_user.id).count == 0 # <- here's the issue, right here.  FUCCCCCCK.  need to check this out ASAP.
  		  profile = Profile.new(profile_params)
  		profile.user_id = current_user.id
  		profile.save
  		#update	
  	else

  	end

  	redirect_to action: 'view', :id => current_user.id

  end

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, :user_id, :birthday)
	end
end
