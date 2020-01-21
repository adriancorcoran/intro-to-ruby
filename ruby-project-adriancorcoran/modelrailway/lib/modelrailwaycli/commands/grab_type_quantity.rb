require 'modelrailwaycli'
require 'json'
require_relative './../../catalogue'

module Modelrailwaycli
  module Commands
    # comment
    class GrabTypeQuantity < Modelrailwaycli::Command
      def call(args, _name)
        raise ArgumentError, 'You must enter 1 class name' if args.size != 1
        # init
        catalogue = Catalogue.new
        # # create catalogue
        catalogue.create_catalog
        # # get the type quantity
        puts catalogue.grab_type_quantity(eval(args[0]))
      rescue ArgumentError => e
        puts e.message
      end

      def self.help
        "Print the total quantity of this type of class in the catalogue.\nUsage: {{command:#{Modelrailwaycli::TOOL_NAME} grab_type_quantity}} classname (e.g. SteamEngine)"
      end
    end
  end
end
