require_relative("../db/sql_runner.rb")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(film)
    @id = film["id"].to_i if film["id"]
    @title = film["title"]
    @price = film["price"].to_i
  end






end
