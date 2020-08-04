require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    name = @view.ask_user_for_name
    address = @view.ask_user_for_address
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
  end

  def list
    # Get the array of meals from the MealRepository object
    customers = @customer_repository.all
    # Sent it to the view, which will loop over and print the attributes
    @view.print(customers)
  end
end
