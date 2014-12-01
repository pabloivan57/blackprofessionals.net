class SearchController < ApplicationController

  before_action :authenticate_user!, :recommend_users

  def index
  end

  def create
    @results = BPNet::Search::User.new(params).find
    render :index
  end

  private

  def recommend_users
    users = User.where.not(id: current_user.id)
    recommender = BPNet::Recommenders::UserRecommender.new(current_user, users)
    @recommendations = recommender.weighted_recommendation.shuffle.first(5)
  end
end
