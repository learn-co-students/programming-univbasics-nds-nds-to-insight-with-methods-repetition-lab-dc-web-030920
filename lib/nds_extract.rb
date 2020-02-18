$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  p result
end

def gross_for_director(source)
  total = 0
  index = 0

  while index < source[:movies].length do
    total += source[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source) # prints an array that contains names.
   # Write this implementation
   list_of_directors = []
    row_index = 0
   while row_index < source.length do
     list_of_directors.push(source[row_index][:name])
     row_index += 1
   end
   p list_of_directors
 # p source[row_index][:name]
end


def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total


# director_counter = 0
# total_sum = 0
#   while director_counter < source.length do
#     total_sum += directors_totals(source)
#     director_counter += 1
#   end
#   p total_sum
sum = 0
directors_totals(source).inject(0) {|sum, hash| sum + hash[1]}


end
