# frozen_string_literal: true

module Todo
  module List
    @file = Pathname.new(File.expand_path('../../tmp/list.yml', __dir__))
    @list = @file.exist? ? YAML.load_file(@file) : []

    class << self
      attr_accessor :list

      def all
        @list.map.with_index do |item, index|
          number = index + 1
          "#{number}. #{item}"
        end
      end

      def add(*items)
        persist { @list.append(*items) }
      end

      def remove(number)
        persist do
          index = number - 1
          @list.delete_at(index)
        end
      end

      private

      def persist
        yield if block_given?
        @file.write(@list.to_yaml)
      end
    end
  end
end
