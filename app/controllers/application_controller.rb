class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def must_be_signed_in
  	if !user_signed_in?
  		# redirect_to('') TODO: find out how to redirect to the previous page
  	end
  end


end
