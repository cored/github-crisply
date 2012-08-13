module Github
  module Crisply
    class ConfigHandler
      attr_reader :config, :account, :token, :project_id

      def initialize
        @config = YAML.load_file(
          File.expand_path(File.dirname(__FILE__))+'/../../../config.yml')
        @account = @config["credentials"]["account"]
        @token = @config["credentials"]["token"]
        @project_id = @config["credentials"]["project-id"]
      end

    end
  end
end
