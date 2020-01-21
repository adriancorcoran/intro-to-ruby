# frozen_string_literal: true

require 'todo'

module Todo
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(
      default: 'list',
      contextual_resolver: nil
    )

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(-> { const_get(const) }, cmd)
    end

    register :List, 'list', 'todo/commands/list'
    register :Add, 'add', 'todo/commands/add'
    register :Remove, 'remove', 'todo/commands/remove'
  end
end
