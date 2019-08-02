class Customer

  def initialize(customer)
    @id = customer["id"].to_i if customer["id"]
    @name = customer["name"]
    @funds = customer["funds"].to_i
  end





end
