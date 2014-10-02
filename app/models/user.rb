class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def import_linkedin_profile(profile)
    first_name = profile.first_name
    last_name  = profile.last_name
    country    = profile.location.name
    job_title  = profile.headline
    industry   = profile.positions.all.first.name
  end
end
