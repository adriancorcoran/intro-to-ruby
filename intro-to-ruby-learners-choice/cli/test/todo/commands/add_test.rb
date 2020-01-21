# frozen_string_literal: true

require 'test_helper'

module Todo
  module Commands
    class AddTest < Todo::CommandTestCase
      def test_add_adds_an_item
        invoke(Add, 'Mangoes')
        assert_equal ['Mangoes'], Todo::List.list
      end

      def test_add_adds_multiple_items
        invoke(Add, 'Kiwis', 'Strawberries')
        assert_equal %w[Kiwis Strawberries], Todo::List.list
      end
    end
  end
end
