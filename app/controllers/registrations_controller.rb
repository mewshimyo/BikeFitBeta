class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    '/profile/edit' # users should be strongly encouraged to actually put in their names
  end
end