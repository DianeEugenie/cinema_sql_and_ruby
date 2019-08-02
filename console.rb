require_relative("./models/customer.rb")
require_relative("./models/film.rb")

require("pry-byebug")

Customer.delete_all()
Film.delete_all()


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

# customer1.delete()
customer3.name = "Paige"
customer3.update()

film1 = Film.new(
  {
    "title" => "The Witches",
    "price" => 5
  }
)

film2 = Film.new(
  {
    "title" => "Something Wicked This Way Comes",
    "price" => 7
  }
)

film3 = Film.new(
  {
    "title" => "The Craft",
    "price" => 5
  }
)

film1.save()
film2.save()
film3.save()

# film2.delete()







binding.pry

nil
