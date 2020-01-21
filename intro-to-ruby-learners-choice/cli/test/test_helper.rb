# frozen_string_literal: true

begin
  addpath = lambda do |p|
    path = File.expand_path("../../#{p}", __FILE__)
    $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
  end
  addpath.call('lib')
end

require 'cli/kit'

require 'todo'

require 'minitest/autorun'
require 'minitest/unit'
require 'mocha/minitest'

module Todo
  class TestCase < Minitest::Test
    protected

    def disable_list_persistence
      Todo::List.stubs(:persist).yields
    end

    def clear_list
      Todo::List.list = []
    end
  end

  class CommandTestCase < TestCase
    def setup
      super
      disable_list_persistence
    end

    def teardown
      super
      clear_list
    end

    protected

    def invoke(command_class, *args)
      command_class.call(args, '')
    end
  end
end
