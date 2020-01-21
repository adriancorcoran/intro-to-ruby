require 'modelrailwaycli'
require 'json'
require_relative './../../catalogue'

module Modelrailwaycli
  module Commands
    # comment
    class GrabTypeCosts < Modelrailwaycli::Command
      def call(args, _name)
        raise ArgumentError, 'You must enter 1 class name' if args.size != 1
        # init
        catalogue = Catalogue.new
        # # create catalogue
        catalogue.create_catalog
        # # get the type quantity
        puts catalogue.grab_type_costs(eval(args[0]))
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        "Prints the cost of each different instance of this class in the catalogue.\nUsage: {{command:#{Modelrailwaycli::TOOL_NAME} grab_type_costs}} classname (e.g. OilTruck)"
      end
    end
  end
end
