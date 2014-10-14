class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    users = User.where.not(id: current_user.id)
    recommender = BPNet::Recommenders::UserRecommender.new(current_user, users)
    @recommendations = recommender.weighted_recommendation.shuffle.first(5)
  end
end
