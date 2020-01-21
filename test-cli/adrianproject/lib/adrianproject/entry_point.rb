require 'adrianproject'

module Adrianproject
  module EntryPoint
    def self.call(args)
      cmd, command_name, args = Adrianproject::Resolver.call(args)
      Adrianproject::Executor.call(cmd, command_name, args)
    end
  end
end
