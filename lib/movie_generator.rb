#require './lib/card'

class MovieGenerator

  def initialize(movielist)
    @movielist = movielist
  end

  def make_movies_array
    #Create empty array for cards from text file to be placed (deck).
    movie_array = []
    #Create array stings that represent each line from text file.
    movie_substrings = IO.readlines(@movielist)
    #Seperate answer, question, and category from each line substring,
    #create card array, place card arrays in single array which is returned.
    movie_substrings.each do |n|
      data_substrings = n.split(", ")
      #Makes card using each index of previous array. Removes new line from category and converts to symbol.
      movie = [data_substrings[0].to_i, data_substrings[1].chomp]
      movie_array << movie
    end
      return movie_array
  end
end
