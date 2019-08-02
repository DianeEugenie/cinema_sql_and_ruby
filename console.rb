require_relative("./models/customer.rb")

require("pry-byebug")


customer1 = Customer.new(
  {
    "name" => "Phoebe",
    "funds" => 50
  }
)

customer2 = Customer.new(
  {
    "name" => "Piper",
    "funds" => 40
  }
)

customer3 = Customer.new(
  {
    "name" => "Prue",
    "funds" => 70
  }
)







binding.pry

nil
