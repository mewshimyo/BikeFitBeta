class ProfileController < ApplicationController
  def end
  end

  def blank
  end

  def view
  	@user = Profile.find(params[:id])
  end
end
