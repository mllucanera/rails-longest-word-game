require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @grid = Array.new(9){("A".."Z").to_a.sample}
    @displ_grid = @grid.join(" ")
  end

  def score
    @attempt = params[:attempt].upcase
    @grid = params[:grid].split(" ")
    @is_a_word = a_word?(@attempt)
    @coinci = coincidence?(@attempt, @grid)
  end

private

  def a_word?(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    dict_reader = open(url).read
    result_dict_hash = JSON.parse(dict_reader)
    return result_dict_hash["found"]
  end

  def coincidence?(attempt, grid)
    attempt.chars.all? { |letter| attempt.count(letter) <= grid.count(letter) }
  end
end

