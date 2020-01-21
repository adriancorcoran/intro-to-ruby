require 'modelrailwaycli'

# comment
module Modelrailwaycli
  # comment
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(
      default: 'help',
      contextual_resolver: nil
    )

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(-> { const_get(const) }, cmd)
    end

    register :Example, 'example', 'modelrailwaycli/commands/example'
    register :Help, 'help',    'modelrailwaycli/commands/help'
    register :CreateCatalogue, 'create_catalogue', 'modelrailwaycli/commands/create_catalogue'
    register :DisplayCatalogue, 'display_catalogue', 'modelrailwaycli/commands/display_catalogue'
    register :CalculateTotalCost, 'calculate_total_cost', 'modelrailwaycli/commands/calculate_total_cost'
    register :GrabTypeQuantity, 'grab_type_quantity', 'modelrailwaycli/commands/grab_type_quantity'
    register :GrabTypeCosts, 'grab_type_costs',    'modelrailwaycli/commands/grab_type_costs'
    register :FindType, 'find_type', 'modelrailwaycli/commands/find_type'
    register :GrabExpensiveItems, 'grab_expensive_items', 'modelrailwaycli/commands/grab_expensive_items'
  end
end
