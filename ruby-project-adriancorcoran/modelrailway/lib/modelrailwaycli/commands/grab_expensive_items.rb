require 'modelrailwaycli'
require 'json'
require_relative './../../catalogue'

module Modelrailwaycli
  module Commands
    # comment
    class GrabExpensiveItems < Modelrailwaycli::Command
      def call(args, _name)
        raise ArgumentError, 'You must enter 1 amount' if args.size != 1
        raise ArgumentError, 'You must enter a numerical amount greater than 0' if args[0].to_i < 1
        # init
        catalogue = Catalogue.new
        # # create catalogue
        catalogue.create_catalog
        # # get the type quantity
        catalogue.grab_expensive_items(args[0].to_i).each(&:display_me)
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        "Selects and prints all items from the catalogue which are >= to the amount you enter.\nUsage: {{command:#{Modelrailwaycli::TOOL_NAME} grab_expensive_items}} amount (e.g. 50)"
      end
    end
  end
end
