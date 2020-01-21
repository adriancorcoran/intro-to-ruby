# frozen_string_literal: true

require 'todo'

module Todo
  module Commands
    class Remove < Todo::Command
      def call(args, _name)
        Todo::List.remove(args.first.to_i)
      end

      def self.help
        'Removes an item from the todo list'
      end
    end
  end
end
