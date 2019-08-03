require_relative("../db/sql_runner.rb")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :screening_id

  def initialize(ticket)
    @id = ticket["id"].to_i if ticket["id"]
    @customer_id = ticket["customer_id"].to_i
    @film_id = ticket["film_id"].to_i
    @screening_id = ticket["screening_id"].to_i
  end

  def save()
    sql = "INSERT INTO tickets
    (customer_id, film_id, screening_id)
    VALUES ($1, $2, $3)
    RETURNING id;"
    values = [@customer_id, @film_id, @screening_id]
    ticket = SqlRunner.run(sql, values)[0]
    @id = ticket["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets;"
    tickets = SqlRunner.run(sql)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id, screening_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@customer_id, @film_id, @screening_id, @id]
    SqlRunner.run(sql, values)
  end

#find all tickets for a specific movie screentime
  def screenings()
    sql = "SELECT * FROM tickets WHERE screening_id = $1 and film_id = $2;"
    values = [@screening_id, @film_id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end
#see how many tickets sold per each specific screentime & movie
  def count()
    screenings().count()
  end






end
