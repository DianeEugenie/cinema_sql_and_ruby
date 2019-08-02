require_relative("../db/sql_runner.rb")

class Screening

  attr_reader :id
  attr_accessor :time

  def initialize(screening)
    @id = screening["id"].to_i if screening["id"]
    @time = screening["time"]
  end


end
