require 'erb'
require 'ostruct'

FOLDER_PATH = File.dirname(File.expand_path(__FILE__))

def render(file, variables)
  erb_file = ERB.new(File.read("#{FOLDER_PATH}/lib/#{file}"))
  context = OpenStruct.new(variables).instance_eval { binding }
  erb_file.run(context)
end

# greeting html

puts render('greeting.html.erb', name: 'Gannon')
puts

# shopping html

puts render('shopping.html.erb', list: ['Rocket Shoes', 'Invisible Ink'])
puts
