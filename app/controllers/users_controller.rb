class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:pro_sign_up]
  before_action :is_same_user?, except: [:pro_sign_up]

  def show
  	@user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
     @user = current_user
    if @user.update_attributes(user_params)
      redirect_to user_path, notice: I18n.t(:pro_update_success)
    else
      flash[:notice] = I18n.t(:wrong_update)
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
      flash[:notice] = I18n.t(:password_fail)
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
      redirect_to user_path, notice: I18n.t(:pic_update_success)
      return
    end
    flash[:notice] = I18n.t(:pic_update_fail)
    render :edit_profpic
  end

  # def destroy
  #   @user = current_user
  #   @user.destroy!
  #   redirect_to root_path, notice: I18n.t(:user_delete)
  # end

  def create
    User.create(user_params)
  end
  private

  def user_params
    params.require(:user).permit(:name, :last_name, :password, :password_confirmation, :current_password, :prof_pic, professional_attributes: [:title, :description, :prof_pic, :price_hr, :location])
  end

    def sign_up_params
    params.require(resource_name).permit(:name, :email, :last_name, :password, :password_confirmation, :current_password, :prof_pic, professional_attributes: [:title, :description, :prof_pic, :price_hr, :location])
  end
end
