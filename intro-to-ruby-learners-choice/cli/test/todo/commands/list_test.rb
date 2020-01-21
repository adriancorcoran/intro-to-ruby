# frozen_string_literal: true

require 'test_helper'

module Todo
  module Commands
    class ListTest < Todo::CommandTestCase
      def setup
        super
        Todo::List.list = %w[Apples Oranges Bananas]
      end

      def test_list_prints_a_numbered_list
        List.any_instance.expects(:puts).with(Todo::List.all)
        invoke(List)
      end
    end
  end
end
