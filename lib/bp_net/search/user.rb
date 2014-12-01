module BPNet
  module Search
    class User

      def initialize(attributes)
        @attributes = attributes.slice(:first_name, :last_name, :job_title).reject { |k ,v| v.blank? }
      end

      def find
        ::User.where(query, *params)
      end

      private

      def query
        attributes.keys.map{ |value| "#{value} like ?"}.join(" OR ")
      end

      def params
        attributes.values.map { |value| "%#{value}%"}
      end

      attr_reader :attributes
    end
  end
end
