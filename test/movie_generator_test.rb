require 'minitest/autorun'
require 'minitest/pride'
require './lib/movie_generator'

class MovieGeneratorTest < Minitest::Test

  def test_movie_generator_exists
    filename = "./lib/movies.txt"
    movies = MovieGenerator.new(filename)

    assert_instance_of MovieGenerator, movies
  end

  def test_movies_method
    filename = "./lib/movies.txt"
    movies = MovieGenerator.new(filename)

    assert_equal Array, movies.make_movies_array.class
    assert_equal 71, movies.make_movies_array[0][0]
    assert_equal "Hannibal Buress: Animal Furnace", movies.make_movies_array[0][1]
    assert_equal 99, movies.make_movies_array.count

  end

end
