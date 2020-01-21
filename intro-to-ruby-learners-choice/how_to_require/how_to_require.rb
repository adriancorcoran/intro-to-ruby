folder_path = File.dirname(File.expand_path(__FILE__))

# absolte require
require "#{folder_path}/lib/absolute_file"

# load path require
$LOAD_PATH.unshift("#{folder_path}/lib/load_path")
require "load_path_file"

# glob absolute require
Dir[File.expand_path("../lib/glob/**/*.rb", __FILE__)].each do |file|
  require file
end

# relative require
require_relative 'lib/relative_file'
