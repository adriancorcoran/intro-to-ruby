require 'adrianproject'

module Adrianproject
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(
      default: 'help',
      contextual_resolver: nil
    )

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(->() { const_get(const) }, cmd)
    end

    register :Example, 'example', 'adrianproject/commands/example'
    register :Help,    'help',    'adrianproject/commands/help'
    register :Adrian, 'adrian', 'adrianproject/commands/adrian'
  end
end
