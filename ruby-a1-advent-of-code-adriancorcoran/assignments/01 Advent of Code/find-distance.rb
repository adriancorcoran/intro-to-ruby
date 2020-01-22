=begin
Theory behind the logic
1 - read the file contents and split into an array to get an array of instructions
2 - use a variable to hold our current direction
  2a - use a variable to hold the key value of our current direction in the directions array
3 - use an array to hold the 4 compass directions (N, E, S, W) in correct order in an array, therefore when we make a turn L or R we
  will know what direction we are facing
4 - use a hash to hold the number of total blocks travelled in each direction
5 - each instruction contains a direction to turn and number of blocks
6 - for each instruction use the first character to determine which direction to go, depending on the current direction and whether it's L or R - use a method for this
7 - for each instruction add the block travelled in that direction to the correct key in the total blocks array

8 - when the loop is finished, substract the total blocks travelled S from total blocks travelled N and get the absolute value
9 - when the loop is finished, substract the total blocks travelled E from total blocks travelled W and get the absolute value
10 - combine the two values to get the total ditance in blocks from the starting point and return this value
=end

# 1 - read the file contents and split into an array to get an array of instructions
instructions = File.open("instructions.txt", "r"){ |file| file.read.split(", ") }

# 2 - use a variable to hold our current direction
current_direction = "N"

# 2a - use a variable to hold the key value of our current direction in the directions array
current_direction_key = 0

# 3 - use an array to hold the 4 compass directions (N, E, S, W) in correct order in an array, therefore when we make a turn L or R we
# will know what direction we are facing
directions = ["N", "E", "S", "W"]

# 4 - use a hash to hold the number of total blocks travelled in each direction
total_blocks = Hash.new(0)

# 5 - each instruction contains a direction to turn and number of blocks
instructions.each do | instruction |
  # get the direction component - first character
  direction = instruction[0..0]
  # get the number of blocks component - remaining characters
  num_blocks = instruction[1..-1].to_i
  # 6 - for each instruction use the first character to determine which direction to go, depending on the current direction and whether it's L or R
    # [authors note] I would normally abstract these calculations into a method to keep the core code cleaner, however the assignment instructions
    # said "no classes" so I left them in here in a preocedural format
  if direction == "R"
    current_direction_key += 1  # turn to the right and increase the key of the directions array
  else
    current_direction_key -= 1  # turn to the left and decrease the key of the directions array
  end
  # check we're not outside the key range of our directions array and adjust if necessary
  if current_direction_key == 4 # too high
    current_direction_key  = 0
  elsif current_direction_key == -1 # too low
    current_direction_key  = 3
  end
  # change direction
  current_direction = directions[current_direction_key]
  # 7 - for each instruction add the blocks travelled in that direction to the correct key in the total blocks array
  total_blocks[current_direction] += num_blocks
end

# 8 - when the loop is finished, substract the total blocks travelled S from total blocks travelled N and get the absolute value
total_blocks_vertical = (total_blocks["N"] - total_blocks["S"]).abs

# 9 - when the loop is finished, substract the total blocks travelled E from total blocks travelled W and get the absolute value
total_blocks_horizontal = (total_blocks["W"] - total_blocks["E"]).abs

# 10 - combine the two values to get the total ditance in blocks from the starting point and return this value
total_distance  = total_blocks_vertical + total_blocks_horizontal

# puts total_distance
puts "The total number of blocks to travel between the drop site and the Easter Bunny Headqurters is #{total_distance} blocks. Better get some comfy runners and start walking!"