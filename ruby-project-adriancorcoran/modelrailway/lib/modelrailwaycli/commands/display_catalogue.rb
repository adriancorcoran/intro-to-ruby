require 'modelrailwaycli'
require 'json'
require_relative './../../catalogue'

module Modelrailwaycli
  # comment
  module Commands
    # comment
    class DisplayCatalogue < Modelrailwaycli::Command
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
      end
    end
  end
end
