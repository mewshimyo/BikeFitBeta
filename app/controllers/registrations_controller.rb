class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    '/profile/edit' # this is here to 'blank out' the profile so it doesn't throw an error.
  end
end