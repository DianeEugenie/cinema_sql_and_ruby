require_relative("../db/sql_runner.rb")

class Customer

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
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end




end
