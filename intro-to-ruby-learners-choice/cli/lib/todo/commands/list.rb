# frozen_string_literal: true

require 'todo'

module Todo
  module Commands
    class List < Todo::Command
      def call(_args, _name)
        puts Todo::List.all
      end

      def self.help
        'Lists the todo list'
      end
    end
  end
end
