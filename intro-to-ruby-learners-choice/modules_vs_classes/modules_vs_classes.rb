module MyAppModule
  class Array < ::Array # lookup and extend toplevel Array class
  end
end

my_array = MyAppModule::Array.new(['element'])
my_array + ['another element']
puts my_array.class

class MyAppClass
  class Greeting # defaults to < ::Object
    def self.greet
      puts 'Hello World! (from class level)'
    end

    def greet
      puts 'Hello World! (from instance)'
    end
  end
end

MyAppClass::Greeting.greet
MyAppClass::Greeting.new.greet
