class ProfileController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to(profile_path)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :industry,
                                 :job_title,
                                 :country,
                                 :zip_code)
  end
end
