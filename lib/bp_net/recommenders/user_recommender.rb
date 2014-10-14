module BPNet
  module Recommenders
    class UserRecommender

      RECOMMENDATION_WEIGHTS = {
        :job_title => 0.6,
        :industry  => 0.4,
        :location  => 0.2
      }

      def initialize(user, users)
        @user  = user
        @users = users
      end

      def recommend_by_field(field_name)
        jaccard_field = "#{field_name}_jaccard_index"

        @users.map! do |other_user|
          other_user.define_singleton_method(jaccard_field) do
            instance_variable_get("@#{jaccard_field}")
          end

          other_user.define_singleton_method("#{jaccard_field}=") do |index|
            instance_variable_set("@#{jaccard_field}", index || 0.0)
          end

          this_user_values = @user.public_send(field_name).split
          other_user_values = other_user.public_send(field_name).split

          intersection = (this_user_values & other_user_values).count
          union = (this_user_values | other_user_values).count
          jaccard_value = (intersection.to_d / union.to_d) * RECOMMENDATION_WEIGHTS[field_name]
          other_user.send("#{jaccard_field}=", jaccard_value) rescue 0.0

          other_user
        end
      end

      def weighted_recommendation
        recommend_by_field(:job_title)
        recommend_by_field(:industry)
        recommend_by_field(:location)

        @users = @users.reject do |u|
          u.job_title_jaccard_index == 0 && u.industry_jaccard_index == 0 && u.location_jaccard_index == 0
        end

        @users.each do
          |u| u.jaccard_total =  u.job_title_jaccard_index + u.industry_jaccard_index + u.location_jaccard_index
        end.sort_by { |u| u.jaccard_total }.reverse
      end
    end
  end
end

