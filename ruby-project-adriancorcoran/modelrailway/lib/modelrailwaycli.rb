require 'cli/ui'
require 'cli/kit'

CLI::UI::StdoutRouter.enable

# comment
module Modelrailwaycli
  extend CLI::Kit::Autocall

  TOOL_NAME = 'modelrailwaycli'.freeze
  ROOT      = File.expand_path('..', __dir__)
  LOG_FILE  = '/tmp/modelrailwaycli.log'.freeze

  autoload(:EntryPoint, 'modelrailwaycli/entry_point')
  autoload(:Commands,   'modelrailwaycli/commands')

  autocall(:Config)  { CLI::Kit::Config.new(tool_name: TOOL_NAME) }
  autocall(:Command) { CLI::Kit::BaseCommand }

  autocall(:Executor) { CLI::Kit::Executor.new(log_file: LOG_FILE) }
  autocall(:Resolver) do
    CLI::Kit::Resolver.new(
      tool_name: TOOL_NAME,
      command_registry: Modelrailwaycli::Commands::Registry
    )
  end

  autocall(:ErrorHandler) do
    CLI::Kit::ErrorHandler.new(
      log_file: LOG_FILE,
      exception_reporter: nil
    )
  end
end
