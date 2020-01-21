# frozen_string_literal: true

require 'test_helper'

module Todo
  class ListTest < Todo::TestCase
    def teardown
      super
      clear_list
    end

    def test_list
      assert_equal [], Todo::List.list
    end

    def test_list_assignment
      Todo::List.list = %w[Cauliflower]
      assert_equal %w[Cauliflower], Todo::List.list
    end

    def test_all_returns_numbered_list
      Todo::List.list = %w[Carrots Celery Broccoli]
      numbered_list = ['1. Carrots', '2. Celery', '3. Broccoli']
      assert_equal numbered_list, Todo::List.all
    end

    def test_add_adds_and_persists_many_items
      Todo::List.expects(:persist).yields
      Todo::List.add('Brussel Sprouts', 'Cabbage', 'Spinach')
      assert_equal %w[Brussel\ Sprouts Cabbage Spinach], Todo::List.list
    end

    def test_remove_removes_and_persists_an_item_by_number
      Todo::List.expects(:persist).yields
      Todo::List.list = %w[Lentils Asparagus]
      Todo::List.remove(1)
      assert_equal %w[Asparagus], Todo::List.list
    end
  end
end
