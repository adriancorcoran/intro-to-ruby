require 'adrianproject'
require 'json'

module Adrianproject
  module Commands
    class Example < Adrianproject::Command
      def call(_args, _name)
        puts 'neato'

        if rand < 0.05
          raise(CLI::Kit::Abort, "you got unlucky!")
        end
      end

      def self.help
        "A dummy command.\nUsage: {{command:#{Adrianproject::TOOL_NAME} example}}"
      end
    end
  end
end
