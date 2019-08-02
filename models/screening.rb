require_relative("../db/sql_runner.rb")

class Screening

  attr_reader :id
  attr_accessor :screen_time

  def initialize(screening)
    @id = screening["id"].to_i if screening["id"]
    @screen_time = screening["time"]
  end

  def save()
    sql = "INSERT INTO screenings (screen_time) VALUES ($1) RETURNING id;"
    values = [@screen_time]
    screening = SqlRunner.run(sql, values)[0]
    @id = screening["id"].to_i
  end


end
