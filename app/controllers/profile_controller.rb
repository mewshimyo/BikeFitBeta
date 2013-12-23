class ProfileController < ApplicationController
  def end

  end

  def blank
  end

  def view
  	#Variables for creating the profile pages
  	@userid = Profile.where(:user_id => params[:id]).last.user_id
  	@firstname = Profile.where(:user_id => params[:id]).last.first_name
  	@lastname = Profile.where(:user_id => params[:id]).last.last_name
  	@birthday = Profile.where(:user_id => params[:id]).last.birthday
  end

  def edit
  	@profile = Profile.new
  	if Profile.where(:user_id => current_user.id).count == 0
  		Profile.new(:user_id => current_user.id, :first_name => "", :last_name => "", :birthday => "")
  	end
  		@ProfileTemp = Profile.where(:user_id => current_user.id).last
  		@firstname = @ProfileTemp.first_name
  		@lastname = @ProfileTemp.last_name
  		@birthday = @ProfileTemp.birthday
  end

  def edit_do
  		@ProfileUpdate = Profile.where(:user_id => current_user.id).last
  		@ProfileUpdate.update(profile_params)
  	end

  	redirect_to action: 'view', :id => current_user.id

  end

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, :user_id, :birthday)
	end
end
