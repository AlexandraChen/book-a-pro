class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :is_same_user?, only: [:edit]
 
  def show
  	@user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
     @user = current_user
    if @user.update_attributes(user_params)
      redirect_to user_path, notice: "Profile successfully updated."
    else
      flash[:notice] = "something went wrong"
      render :edit_profile
    end
  end

  def edit_password
  	@user = current_user
  end

  def update_password
    @user = current_user
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, bypass: true
      redirect_to root_path
    else
      flash[:notice] = t(:password_fail)
      render :edit_password
    end
  end

  def edit_profpic
    @user = current_user
  end

  def update_profpic
    @user = current_user
    @user.update_attributes(user_params)
    if @user.valid?
      @user.save
      redirect_to user_path, notice: t(:pic_update_success)
      return
    end
    flash[:notice] = t(:pic_update_fail)
    render :edit_profpic
  end

 

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :password, :password_confirmation, :current_password, :prof_pic)
  end
end
