module Github
  module Crisply
    class Factory
      def config_handler
        ConfigHandler.new
      end

      def crisply_client(account, username) 
        Client.new(:account => account, :username => username)
      end
    end
  end
end
