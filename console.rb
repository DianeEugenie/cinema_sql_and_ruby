require_relative("./models/customer.rb")

require("pry-byebug")

Customer.delete_all()


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

customer1.save()
customer2.save()
customer3.save()







binding.pry

nil
