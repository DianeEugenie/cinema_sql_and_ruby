require_relative("../db/sql_runner.rb")
require_relative("./customer.rb")
require_relative("./screening.rb")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(film)
    @id = film["id"].to_i if film["id"]
    @title = film["title"]
    @price = film["price"].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    film = SqlRunner.run(sql, values)[0]
    @id = film["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films;"
    films = SqlRunner.run(sql)
    return films.map{|film| Film.new(film)}
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3;"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  #See which customers are coming to see one film.

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = $1;"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map{|customer| Customer.new(customer)}
  end

  #Check how many customers are going to watch a certain film

  def customer_count()
    return customers().count()
  end

  # Write a method that finds out what is the most popular time (most tickets sold) for a given film

  #method to show all screenings of a movie
  def screenings()
    sql = "SELECT screenings.* FROM screenings INNER JOIN tickets ON screenings.id = tickets.screening_id WHERE tickets.film_id = $1;" #returns a hash with screening_ids of a specific film
    values = [@id]
    screenings_hash = SqlRunner.run(sql, values)
    return screenings_hash.map{|screen| Screening.new(screen)}
  end

  def popular()
    all_screens = screenings()
    screening = all_screens.map{|screening| screening.screen_time}
    #map all the screen_times of a specific movie = array of e.g. ["16:00", "16:00", "18:00", "14:00", "16:00"]

    counts = Hash.new(0)
    popular_time = screening.max_by {|time| counts[time] += 1} #gives the max value so in this case the once that is counted the most
    return popular_time

  end





#     SELECT username, email, COUNT(*)
# FROM users
# GROUP BY username, email
# HAVING COUNT(*) > 1






end
