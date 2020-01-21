# % cat lib/dayofweek.rb
#use this linke to check output http://people.albion.edu/imacinnes/calendar/Day_of_the_Week.html
#use the algorithm here https://cs.uwaterloo.ca/~alopez-o/math-faq/node73.html
require 'date'
require 'byebug'

class Dayofweek
  def self.day
    puts "Hello from day of the week gem! "
    puts "Enter a date (yyyy-mm-dd)"
    dateEntered = gets.chomp
    d = Date._strptime(dateEntered, '%Y-%m-%d')
    if d == nil
      puts "Something went wrong. Try again with correct format"
    else
      puts "you entered #{d}"
      #validate days in feburary 
      leap = Date.leap?(d[:year])
      if (leap && d[:mon] ==2 && d[:mday] > 29)
        puts "Date cannot be higher than 29 in feburary of leap year"
        return
      elsif (!leap && d[:mon] ==2 && d[:mday] > 28)
        puts "Date cannot be higher than 28 in feburary of leap year"
        return
      end
      k = d[:mday]
      yearTemp = d[:year].to_s
      c = yearTemp[0..1].to_i
      y = yearTemp[2..3].to_i
      case d[:mon]
      when 1
        m = 11
        y = y - 1
      when 2
        m = 12
        y = y - 1
      else
        m = d[:mon]-2
      end

      #formulae to calculate the day of the week
      dayNum = (k+(2.6*m -0.2).floor - (2*c) + y + (y/4).floor + (c/4).floor).modulo(7)
      puts "DAY = #{dayNum}"
      #convert number to day of the week
      case dayNum
      when 0
        puts "Sunday"
        return "Sunday"
      when 1
        puts "Monday"
        return "Monday"
      when 2
        puts "Tuesday"
        return "Tuesday"
      when 3
        puts "Wednesday"
        return "Wednesday"
      when 4
        puts "Thursday"
        return "Thursday"
      when 5
        puts "Friday"
        return "Friday"
      when 6
        puts "Saturday"
        return "Saturday"
      end
    end
  end
end
