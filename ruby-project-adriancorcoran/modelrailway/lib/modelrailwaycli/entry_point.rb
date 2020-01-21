require 'modelrailwaycli'

# comment
module Modelrailwaycli
  # comment
  module EntryPoint
    def self.call(args)
      cmd, command_name, args = Modelrailwaycli::Resolver.call(args)
      Modelrailwaycli::Executor.call(cmd, command_name, args)
    end
  end
end
