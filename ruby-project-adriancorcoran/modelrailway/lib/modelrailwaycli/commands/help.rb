# run commands from terminal
# ./exe/Modelrailwaycli help

require 'modelrailwaycli'

module Modelrailwaycli
  module Commands
    # comment
    class Help < Modelrailwaycli::Command
      def call(_args, _name)
        puts CLI::UI.fmt('{{bold:Available commands}}')
        puts ''

        Modelrailwaycli::Commands::Registry.resolved_commands.each do |name, klass|
          next if name == 'help'
          puts CLI::UI.fmt("{{command:#{Modelrailwaycli::TOOL_NAME} #{name}}}")
          if (help = klass.help)
            puts CLI::UI.fmt(help)
          end
          puts ''
        end
      end
    end
  end
end
