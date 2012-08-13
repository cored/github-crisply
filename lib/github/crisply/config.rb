module Github
  module Crisply
    class ConfigHandler
      attr_reader :config, :account, :username, :project_id

      def initialize
        @config = YAML.load_file(
          File.expand_path(File.dirname(__FILE__))+'/../../../config.yml')
        @account = self.config["credentials"]["account"]
        @username = self.config["credentials"]["username"]
        @project_id = self.config["credentials"]["project-id"]
      end

    end
  end
end
