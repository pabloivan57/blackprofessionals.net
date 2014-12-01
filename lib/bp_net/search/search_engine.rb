module BPNet
  module Search
    class SearchEngine

      def initialize(type, params)
        @type = type
        @params = params
      end

      def find
        results = []
        results = BPNet::Search::User.new(@params).find if(@type == 'individuals')
      end

      private

      attr_reader :type, :params
    end
  end
end
