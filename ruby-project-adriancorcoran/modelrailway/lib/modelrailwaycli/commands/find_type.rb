require 'modelrailwaycli'
require 'json'
require_relative './../../catalogue'

module Modelrailwaycli
  module Commands
    # comment
    class FindType < Modelrailwaycli::Command
      def call(args, _name)
        raise ArgumentError, 'You must enter 1 class name' if args.size != 1
        # init
        catalogue = Catalogue.new
        # # create catalogue
        catalogue.create_catalog
        # # get the type quantity
        catalogue.find_type(eval(args[0])).each(&:display_me)
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        "Prints out the instances of this type of class in the catalogue.\nUsage: {{command:#{Modelrailwaycli::TOOL_NAME} find_type}} classname (e.g. Station)"
      end
    end
  end
end
