require_relative("./models/customer.rb")
require_relative("./models/film.rb")
require_relative("./models/ticket.rb")

require("pry-byebug")

Ticket.delete_all()
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
# customer3.name = "Paige"
# customer3.update()

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
# film3.title = "Practical Magic"
# film3.update()

ticket1 = Ticket.new(
  {
    "customer_id" => customer1.id,
    "film_id" => film1.id
  }
)

ticket2 = Ticket.new(
  {
    "customer_id" => customer2.id,
    "film_id" => film2.id
  }
)

ticket3 = Ticket.new(
  {
    "customer_id" => customer3.id,
    "film_id" => film3.id
  }
)

ticket4 = Ticket.new(
  {
    "customer_id" => customer2.id,
    "film_id" => film3.id
  }
)

ticket5 = Ticket.new(
  {
    "customer_id" => customer1.id,
    "film_id" => film2.id
  }
)


ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()

# ticket2.delete()

# ticket5.customer_id = customer2.id
# ticket5.update()




binding.pry

nil
