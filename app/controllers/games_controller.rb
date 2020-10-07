class GamesController < ApplicationController
  def new
    @letters = Array('A'..'Z')
    @grid = []
  end

  def score
  end
end
