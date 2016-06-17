module Awsssh
  module Commands
    class List
      def initialize(opts={})
        @opts = {}
      end

      def execute
        Awsssh::Credentials.set_configuration
        client.describe_instances
      end

      private

        def client
          @client ||= Aws::EC2::Client.new
        end
    end
  end
end
