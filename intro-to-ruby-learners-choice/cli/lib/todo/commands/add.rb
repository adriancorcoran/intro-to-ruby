# frozen_string_literal: true

require 'todo'

module Todo
  module Commands
    class Add < Todo::Command
      def call(args, _name)
        Todo::List.add(*args)
      end

      def self.help
        'Adds an item to the todo list'
      end
    end
  end
end
