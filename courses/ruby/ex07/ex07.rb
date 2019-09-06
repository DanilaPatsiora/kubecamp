require "yaml"
FILE_NAME = "config.yml".freeze
module MyApp
  def config
    Config.instance
  end
  class Config
    private_class_method :new
    @@instance = YAML.load(File.read(FILE_NAME))
    def method_missing(m)
      instance_variable_get(instance_variables[0])[m.to_s] || "Undefined field"
    end

    def self.instance
      @@instance
    end
  end
  module_function :config
end
