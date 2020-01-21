require 'modelrailwaycli'
require 'json'
require_relative './../../catalogue'

module Modelrailwaycli
  module Commands
    # comment
    class CreateCatalogue < Modelrailwaycli::Command
      def call(_args, _name)
        # init
        catalogue = Catalogue.new
        # create catalogue
        catalogue.create_catalog
        # display the full catalogue
        catalogue.display_catalog
      end

      def self.help
        'Creates and displays the catalogue'
        # "Print the multiplication of 2 numbers.\nUsage: {{command:#{Modelrailwaycli::TOOL_NAME} adriantest}} 5 7"
      end
    end
  end
end
