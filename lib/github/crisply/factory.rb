module Github
  module Crisply
    class Factory
      def config_handler
        ConfigHandler.new
      end

      def crisply_client(account, token) 
        Client.new(:account => account, :token => token)
      end
    end
  end
end
