require 'adrianproject'
require 'json'

module Adrianproject
  module Commands
    class Adrian < Adrianproject::Command
      def call(args, _name)
        multiply = args.map(&:to_i).inject(&:*)
        puts multiply
      end
      def self.help
        "Print the multiplication of 2 numbers.\nUsage: {{command:#{Adrianproject::TOOL_NAME} adrian}} 5 7"
      end
    end
  end
end
