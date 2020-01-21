2.times { puts "-"}

# (1) Create a regular expression that matches a valid DOI (digital objective identifier)
# e.g. https://doi.org/10.xxxx/xxxxx
regex = /https?:\/\/doi\.org\/10\.(.{4})\/(.*)/i
strings = [
  "https://doi.org/10.6754/jghuygusdt7676", # => Match
  "https://doi.org/10.00987/bhaydilhu", # => No Match
  "https://doi.org/10.aa45/56", # => No Match
  "https://doi.org/10.jhkjhkadj/jghuygusdt7676" # => Match
]

strings.each do |string|
   puts "Matching: " + string + (string.match(regex) ? " - Match!" : " - No Match :(")
end

2.times { puts "-"}

# (2) Given a string of the format shown below, create a regular expression that
# returns the first "word", the number inside the parentheses, and the "word" after the arrow.
# e.g. dvkug (90) -> tbjbz
regex = /(\b\w*\b) \(([0-9]*)\) -> (\w*)/
strings = [
  "dvkug (90) -> tbjbz", # => dvkug, 90, tbjbz
  "sandstone (198987) -> neat", # => sandstone, 198987, neat
  "alphabet (6) -> last", # => alphabet, 6, last
  "door (678) -> handle" # => door, 678, handle
]

strings.each do |string|
  mtch = string.match(regex)
  puts "Matched the first word: #{mtch[1]}, the number #{mtch[2]}, and the second word #{mtch[3]}"
end

2.times { puts "-"}

# (3) Given a string of the format shown below (variable name followed by inc or dec, a number,
# if, and a boolean expression), create a regular expression that returns the variable name, the number, and the boolean expression.
# e.g. ebu inc 626 if iq < 0
regex = /^(\w*) \w* (\d*) (.*)/
strings = [
  "ebu inc 626 if iq < 0", # => ebu, 626, if iq < 0
  "var dec 1 while a >= 90", # => var, 1, while a >= 90
  "my_var inc 76763 if other_var = 100", # => my_var, 76763, if other_var = 100
  "The_VAR inc 90809809 unless hat.name = 'top hat'" # => The_VAR, 90809809, unless hat.name = 'top hat'
]

strings.each do |string|
  mtch = string.match(regex)
  puts "Matched the variable: #{mtch[1]}, the number #{mtch[2]}, and the expression #{mtch[3]}"
end
