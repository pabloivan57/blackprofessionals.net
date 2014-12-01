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
      redirect_to(profile_path(@user))
    else
      render :edit
    end
  end

  def import
    if params[:code].nil?
      redirect_to(BPNet::LinkedIn::Client.new.auth_code_url)
      return
    end
    api = BPNet::LinkedIn::Client.new(params[:code])
    @user = current_user
    if @user.update_attributes(api.profile)
      redirect_to(profile_path(@user))
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
                                 :state,
                                 :zip_code)
  end
end
