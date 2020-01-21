# 1 - read the file contents from the function variable, remove whitespace, double extra lines and return the text
def get_my_book(filename)
  # read the file, remove whitespace before and after
  text = File.open(filename, "r"){ |file| file.read.strip }
  # clean the contents - remove start and end of book and double extra lines
  text = text.split('***END OF THE PROJECT GUTENBERG EBOOK')[0].split('email ccx074@pglaf.org')[1].gsub(/^\s*\n\s*\n/, '')
end

# 2 - function to take in a hash and swap out pieces of text
def the_old_switcheroo(book, hash_data)
  # start looping
  hash_data.each do |replace_this, with_this|
    book  = book.gsub(replace_this, with_this)
  end
  book
end

# 3 - function to analyse the book depending on the options given
def analyse_the_book(book, options)
  # common counting function used below
  count_stuff = Proc.new do |book, pattern|
    return_count  = book.scan(pattern).length
  end
  # --------------------------
  analysis  = Hash.new
  book_array  = book.split(' ').map { |x| x.gsub(/[\W]/, '') }
  # --------------------------
  analysis["Number of chapters"] = count_stuff.call(book, /(CHAPTER)/) if options[:count_chapters]
  # --------------------------
  # number of times main characters are mentioned
  if options[:count_main_characters]
    monday  = count_stuff.call(book, /(Monday)/)
    sparrowson  = count_stuff.call(book, /(Sparrowson)/)
    analysis["Main Character Mentions"] = "Sparrowson is mentioned #{sparrowson} times whereas Monday is mentioned by name #{monday} times!"
  end
  # --------------------------
  analysis["Number of sentences"] = count_stuff.call(book, /(.*\.)/) if options[:count_sentences]
  # --------------------------
  analysis["Number of commas"] = count_stuff.call(book, /(,+)/) if options[:count_commas]
  # average commas per sentences
  if options[:count_sentences] && options[:count_commas]
    analysis["Average commas per sentence"] = (analysis["Number of commas"] / analysis["Number of sentences"]).to_s + " - Old School!"
  end
  # --------------------------
  analysis["Number of verbs"] = count_stuff.call(book, /(\b\w+ing)/) if options[:count_verbs]
  # --------------------------
  # frequency of words
  if options[:freq_words][:run]
    freq_words  = Hash.new(0)
    book_array.each { |word| freq_words[word] += 1 if word.length > options[:freq_words][:min_char_length] }
    freq_words = freq_words.sort_by {|word, num_times| num_times }.reverse!
    analysis["Top #{options[:freq_words][:num_results]} Words (Longer then #{options[:freq_words][:min_char_length]} chars)"] = freq_words.take(options[:freq_words][:num_results])
  end
  # --------------------------
  # frequency of names - capitalized, not at start of sentence, preceded by word and space
  if options[:freq_names][:run]
    freq_names  = Hash.new(0)
    names = book.scan(/[a-zA-Z] ([A-Z][a-z]+\b)/)
    # names.each { |word|
    names.each do |word|
      # remove ",[,] from the word strings - being added somehow - very weird and giving incorrect character length
      word = word.to_s.gsub(/[\[\]"]/, '')
      freq_names[word] += 1 if word.length > options[:freq_names][:min_char_length]
    end
    freq_names = freq_names.sort_by {|word, num_times| num_times }.reverse!
    analysis["Top #{options[:freq_names][:num_results]} Names (Longer then #{options[:freq_names][:min_char_length]} chars)"] = freq_names.take(options[:freq_names][:num_results])
  end
  # --------------------------
  # return
  analysis
end

# --------------------------
# 1 - get the book
book  = get_my_book("text.txt")

# 2 - swap values in the text with those supplied in a hash
hash_data = {
  /Daniel Defoe/ => "Willem Defoe", # => change author to actor Willem Defoe
  /Robinson Crusoe/ => "Sparrowson Stewflow",  # => change character full name
  /(R|r)obinson/ => "Sparrowson", # => change any typos of lower case character name
  /Friday/ => "Monday", # => change Friday's name to Monday
  /(the|our|this|my|an) islands?/i => "Ireland", # => change all occurrences of the (or a variation of) island to Ireland
}
book = the_old_switcheroo(book, hash_data)

# 3 - analyse the book text
options = {
  # num chapters
  :count_chapters => true,
  # number of times Man Monday is mentioned versus Sparrowson Stewflow
  :count_main_characters => true,
  # number of sentences
  :count_sentences => true,
  # frequency of words
  :freq_words => {
    :run => true,
    :min_char_length => 6,
    :num_results => 10,
  },
  :num_top_words => 10,
  # number of commas in a sentence - old school
  # average commas / sentence
  :count_commas => true,
  # number of verbs - ing
  :count_verbs => true,
  # names - capital letter but not at start of sentence
  :freq_names => {
    :run => true,
    :min_char_length => 3,
    :num_results => 20,
  },
}
book_analysis = analyse_the_book(book, options)


# show results
book_analysis.each do |key, value|
  # check for array
  if value.is_a? Array
    puts "#{key}:"
    value.each { |item| puts "  #{item[0]}, #{item[1]}" }
  else
    puts "#{key}: #{value}"
  end
end


# --------------------------
# Create a html version of the book
# --------------------------
# copy the book and remove everything up to first CHAPTER
html = "CHAPTER I—START IN LIFE" + book.split('CHAPTER I—START IN LIFE')[1]

# add table of contents from chapter titles
html_toc = "<h1>Chapter List</h1>\n"
chapters = html.scan(/(CHAPTER.*)/)
toc = chapters.map do |chapter|
  # remove apostraphes and square brackets that seem to get added to scan results
  chapter = chapter.to_s.gsub(/[\[\]"]/, '')
  html_toc += "<a href=\"#{chapter}\" title=\"Jump to #{chapter}\">#{chapter}</a>\n"
end
puts html_toc

# patterns to match and wrap in tags
patterns_to_tags = {
  /(CHAPTER.*)/ => ["<h2 id=\"\\1\">", "</h2>"],  # => put chapters is h2 tags
  /(^\s*\n)/ => ["</p>", "<p>"],  # => wrap new lines in paragraphs
  /(Sparrowson Stewflow)/ => ["<strong>", "</strong>"],  # => all mentions of our hero in bold
  /(Monday)/ => ["<em>", "</em>"],  # => all mentions of our hero's servant in italic
}

# loop through the patterns, modify the book text and write to file
patterns_to_tags.each do |pattern, tag|
  html = html.gsub(pattern, "#{tag[0]}\\1#{tag[1]}")
end

# tidy up some stuff
html = html.gsub(/(\n<\/p>)/, "</p>\n")  # => </p> on newline
html = html.gsub(/(\n\n)/, "\n")  # => remove double newlines
html = html.gsub(/<\/h2>\n([\w\s]{1,20})/, "</h2>\n<p>\\1")  # => add starting <p> tag

# write to file
html_file = File.open("text.html", "w")
html_file.write(html_toc + html)
html_file.close
