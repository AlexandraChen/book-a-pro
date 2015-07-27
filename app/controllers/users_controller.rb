class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :is_same_user?, only: [:edit]
 
  def show
  	@user = User.find(current_user.id)
  end

  def edit_password
  	@user = User.find(current_user.id)
  end
  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, bypass: true
      redirect_to root_path
    else
      render "edit"
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   @user.assign_attributes(user_params)
  #   if @user.valid?
  #     @user.save
  #     render status: 200, json: @user
  #     # redirect_to user_path(@user)
  #     return
  #   end
  #   render :edit
  # end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
