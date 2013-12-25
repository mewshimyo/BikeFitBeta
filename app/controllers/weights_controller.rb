class WeightsController < ApplicationController
  def view
  end

  def new
    @weight = Weight.new
  end

  def create
    @weight = Weight.new(weight_params)
    @weight.user_id = current_user.id
    @weight.save

    redirect_to controller: "profile", action: "view", :id => current_user.id

  end

  def edit
  end

  def all
  end

  def weight_params
    params.require(:weight).permit(:user_id, :date, :reading)
  end
end
