# frozen_string_literal: true

require 'test_helper'

module Todo
  module Commands
    class RemoveTest < Todo::CommandTestCase
      def setup
        super
        Todo::List.list = %w[Blueberries Pineapples Durians]
      end

      def test_remove_removes_the_last_item
        invoke(Remove)
        assert_equal %w[Blueberries Pineapples], Todo::List.list
      end

      def test_remove_removes_an_item_given_a_number
        invoke(Remove, '2')
        assert_equal %w[Blueberries Durians], Todo::List.list
      end
    end
  end
end
