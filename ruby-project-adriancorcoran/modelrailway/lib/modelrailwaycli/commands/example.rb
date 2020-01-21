require 'modelrailwaycli'
require 'json'

module Modelrailwaycli
  module Commands
    # comment
    class Example < Modelrailwaycli::Command
      def call(_args, _name)
        puts 'neato'

        raise(CLI::Kit::Abort, 'you got unlucky!') if rand < 0.05
      end

      def self.help
        "A dummy command.\nUsage: {{command:#{Modelrailwaycli::TOOL_NAME} example}}"
      end
    end
  end
end
