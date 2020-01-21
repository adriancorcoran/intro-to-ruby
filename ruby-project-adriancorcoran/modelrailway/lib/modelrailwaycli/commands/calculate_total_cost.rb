require 'modelrailwaycli'
require 'json'
require_relative './../../catalogue'

module Modelrailwaycli
  module Commands
    # comment
    class CalculateTotalCost < Modelrailwaycli::Command
      def call(_args, _name)
        # init
        catalogue = Catalogue.new
        # create catalogue
        catalogue.create_catalog
        # display the total cost of the catalogue
        catalogue.display_total_cost
      end

      def self.help
        'Shows the total cost of the current catalogue'
      end
    end
  end
end
