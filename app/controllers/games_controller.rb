require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = Array('A'..'Z')
    @grid = []
  end

  def score
    # binding.pry
    @attempt = (params[:answer] || "").upcase
    @grid = params[:grid].split(/ /)
    @in_grid = word_in_grid?(@attempt, @grid)
    @grid_to_string = @grid.join(", ")
    @english_word = english_word?(@attempt)
  end

  private

  def word_in_grid?(attempt, grid)
    attempt.split("").all? do |letter|
      true_or_false = grid.include?(letter)
      grid.delete_at(grid.index(letter)) if true_or_false == true
      true_or_false
    end
  end

  def english_word?(word)
    url = 'https://wagon-dictionary.herokuapp.com/' + word
    dictionary = open(url).read
    word = JSON.parse(dictionary)
    word['found']
  end
end
