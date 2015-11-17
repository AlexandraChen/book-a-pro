class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.professional = Professional.new
    respond_with self.resource
  end

  private
 
  def sign_up_params
    params.require(resource_name).permit(:name, :email, :last_name, :password, :password_confirmation, :current_password, :prof_pic, professional_attributes: [:title, :description, :prof_pic, :price_hr, :location])
  end

end
