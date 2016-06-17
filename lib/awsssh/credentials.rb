module Awsssh
  class Credentials
    def self.set_configuration
      config_file = File.expand_path("~/.awsssh/config.json")
      config = JSON.load(File.read(config_file))
      Aws.config[:credentials] = Aws::Credentials.new(config['AccessKeyId'], config['SecretAccessKey'])
      Aws.config[:region] = config['region']
    end
  end
end
