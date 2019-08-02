require_relative("../db/sql_runner.rb")

class Screening

  attr_reader :id
  attr_accessor :screen_time

  def initialize(screening)
    @id = screening["id"].to_i if screening["id"]
    @screen_time = screening["screen_time"]
    @total = 0
  end

  def save()
    sql = "INSERT INTO screenings (screen_time) VALUES ($1) RETURNING id;"
    values = [@screen_time]
    screening = SqlRunner.run(sql, values)[0]
    @id = screening["id"].to_i

  end

  def self.delete_all()
    sql = "DELETE FROM screenings;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM screenings;"
    screenings = SqlRunner.run(sql)
    return screenings.map{|screening| Screening.new(screening)}
  end

  #Find all tickets for a screen_time (regardless of movie)

  def tickets()
    sql = "SELECT tickets.* FROM tickets INNER JOIN screenings ON screenings.id = tickets.screening_id WHERE screening_id = $1;"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

  #Count tickets sold for specific screen_time
  def count_tickets
    sold_tickets = tickets().count()
    @total + sold_tickets
  end




end
