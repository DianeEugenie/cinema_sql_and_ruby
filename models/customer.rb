require_relative("../db/sql_runner.rb")
require_relative("./film.rb")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(customer)
    @id = customer["id"].to_i if customer["id"]
    @name = customer["name"]
    @funds = customer["funds"].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    customers = SqlRunner.run(sql)
    return customers.map{|customer| Customer.new(customer)}
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2)
    WHERE id = $3;"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  #Show which films a customer has booked to see

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1;"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map{|film| Film.new(film)}
  end

  #Buying tickets should decrease the funds of the customer by the price #

  def buy()
    #films the customer has tickets to
    all_films = films()
    #sum the films (as there can be more than one) and from each film add the price up and assign it to price
    price = all_films.sum{|film| film.price}
    return @funds - price
  end

  # Check how many tickets were bought by a customer
  def tickets()
    #use get all films customer booked and use count
    films().count()
  end



end
