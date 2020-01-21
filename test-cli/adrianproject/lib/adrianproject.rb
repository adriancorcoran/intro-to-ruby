require 'cli/ui'
require 'cli/kit'

CLI::UI::StdoutRouter.enable

module Adrianproject
  extend CLI::Kit::Autocall

  TOOL_NAME = 'adrianproject'
  ROOT      = File.expand_path('../..', __FILE__)
  LOG_FILE  = '/tmp/adrianproject.log'

  autoload(:EntryPoint, 'adrianproject/entry_point')
  autoload(:Commands,   'adrianproject/commands')

  autocall(:Config)  { CLI::Kit::Config.new(tool_name: TOOL_NAME) }
  autocall(:Command) { CLI::Kit::BaseCommand }

  autocall(:Executor) { CLI::Kit::Executor.new(log_file: LOG_FILE) }
  autocall(:Resolver) do
    CLI::Kit::Resolver.new(
      tool_name: TOOL_NAME,
      command_registry: Adrianproject::Commands::Registry
    )
  end

  autocall(:ErrorHandler) do
    CLI::Kit::ErrorHandler.new(
      log_file: LOG_FILE,
      exception_reporter: nil
    )
  end
end
