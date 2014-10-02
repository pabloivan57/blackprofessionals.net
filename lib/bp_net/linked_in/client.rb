module BPNet
  module LinkedIn
    class Client

      def initialize(auth_code = nil)
        @auth_code = auth_code
      end

      def auth_code_url
       oauth.auth_code_url
      end

      def profile
        profile = api.profile(fields: ["headline", "first-name", "last-name", "educations", "positions", "location", "picture-url"])
        from_raw_profile(profile)
      end

      private

      attr_reader :auth_code

      def from_raw_profile(raw_profile)
      {
        first_name: raw_profile.first_name,
        last_name:  raw_profile.last_name,
        country:    raw_profile.location.name,
        job_title:  raw_profile.headline,
        industry:   raw_profile.positions.all.first.company.name,
        profile_image_url: raw_profile.picture_url
      }
      end

      def oauth
        @oauth ||= ::LinkedIn::OAuth2.new
      end

      def access_token
        @access_token ||=  oauth.get_access_token(auth_code)
      end

      def api
        @api ||= ::LinkedIn::API.new(access_token)
      end

    end
  end
end

