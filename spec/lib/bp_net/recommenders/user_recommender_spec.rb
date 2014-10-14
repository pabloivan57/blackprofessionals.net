require 'spec_helper'

describe BPNet::Recommenders::UserRecommender do
  let(:user_1) do
    create(:user, first_name: 'Pablo',
                  job_title: 'iOS Developer',
                  country: 'United States',
                  city: 'Los Angeles')
  end

  let(:user_2) do
    create(:user, first_name: 'Jacky',
                  job_title: 'iOS Developer',
                  country: 'United States',
                  city: 'New York')
  end

  let(:user_3) do
    create(:user, first_name: 'Jerry',
                  job_title: 'iOS Programmer',
                  country: 'United States',
                  city: 'Los Angeles')
  end

  let(:user_4) do
    create(:user, first_name: 'Tan',
                  job_title: 'Professor',
                  country: 'Canada',
                  city: 'Toronto')
  end

  describe '#recommend_job_title' do
    let(:users)       { [user_2, user_3, user_4] }
    let(:recommender) { described_class.new(user_1, users) }

    it 'should return a list of recommended users' do
      recommended_list = recommender.recommend_by_field(:job_title)
      expect(recommended_list).to include(user_2, user_3, user_4)
      expect(recommended_list).to_not include(user_1)
    end

    it 'should return a list of ordered recommended users' do
      recommended_list = recommender.recommend_by_field(:job_title)
      first_recommendation  = recommended_list.first
      second_recommendation = recommended_list.second

      expect(first_recommendation.job_title_jaccard_index).to be > second_recommendation.job_title_jaccard_index
    end

    it 'should recommende job titles based on similarity' do
      recommended_list = recommender.recommend_by_field(:job_title)
      first_recommendation  = recommended_list.first
      second_recommendation = recommended_list.second

      expect(first_recommendation).to eq(user_2)
      expect(second_recommendation).to eq(user_3)
    end
  end


  describe '#recommend_location' do
    let(:users)       { [user_2, user_3, user_4] }
    let(:recommender) { described_class.new(user_1, users) }

    it 'should return a list of recommended users' do
      recommended_list = recommender.recommend_by_field(:location)
      expect(recommended_list).to include(user_2, user_3, user_4)
      expect(recommended_list).to_not include(user_1)
    end

    it 'should return a list of ordered recommended users' do
      recommended_list = recommender.recommend_by_field(:location)
      first_recommendation  = recommended_list.first
      second_recommendation = recommended_list.second

      expect(first_recommendation.location_jaccard_index).to be < second_recommendation.location_jaccard_index
    end

    it 'should recommended location based on similarity' do
      recommended_list = recommender.recommend_by_field(:location)
      first_recommendation  = recommended_list.first
      second_recommendation = recommended_list.second

      expect(first_recommendation).to eq(user_2)
      expect(second_recommendation).to eq(user_3)
    end
  end

  describe '#weigthed_recommendation' do
    let(:users) { [user_2, user_3, user_4] }
    let(:recommender) { described_class.new(user_1, users) }

    it 'should return a list of users sorted by weigthed recomendation' do
      users = recommender.weighted_recommendation
    end
  end
end
