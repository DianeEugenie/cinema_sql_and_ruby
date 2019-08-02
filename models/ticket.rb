require_relative("../db/sql_runner.rb")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(ticket)
    @id = ticket["id"].to_i if ticket["id"]
    @customer_id = ticket["customer_id"].to_i
    @film_id = ticket["film_id"].to_i
  end





end
