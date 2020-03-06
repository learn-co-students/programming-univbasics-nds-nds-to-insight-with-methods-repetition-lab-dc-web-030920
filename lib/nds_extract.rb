require 'pry'

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
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  name = []
  array_index = 0 
  while array_index < source.length do
    name_index = 0 
    while name_index < source[array_index].length  do 
      name << source[array_index][:name]
      name_index += 1 
    end
    array_index += 1 
  end
  name
end

def total_gross(source)
  grand_total = 0 
  director_index = 0 
  while director_index < source.length do 
    grand_total += gross_for_director(source[director_index])
    director_index += 1 
  end
  grand_total
end


