require_relative("../db/sql_runner.rb")

class Screening

  attr_reader :id
  attr_accessor :screen_time

  def initialize(screening)
    @id = screening["id"].to_i if screening["id"]
    @screen_time = screening["time"]
  end

  # def save()
  #   sql = "INSERT INTO screenings"
  #
  #
  # end


end
