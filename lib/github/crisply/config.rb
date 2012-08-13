module Github
  module Crisply
    class ConfigHandler
      attr_reader :config, :account, :username

      def initialize
        @config = YAML.load_file(
          File.expand_path(File.dirname(__FILE__))+'/../../../config.yml')
        @account = self.config["credentials"]["account"]
        @username = self.config["credentials"]["username"]
      end

    end
  end
end
