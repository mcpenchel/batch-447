require_relative '../views/orders_view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repo, customer_repo, employee_repo, order_repo)
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    @order_repo = order_repo
    @view = OrdersView.new
  end

  #################################
  # DELIVERY PERSON (GUY) ACTIONS #
  #################################
  def list_my_orders(employee)
    # We didn't refactor because it's dangerous to refactor code
    # while we're tripping (it's a joke, no one was tripping in a literal way)
    orders = @order_repo.undelivered_orders.select do |order|
      order.employee.id == employee.id
    end

    @view.print_orders(orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    order_index = @view.ask_for_order_index
    # We didn't refactor because it's dangerous to refactor code
    # while we're tripping (it's a joke, no one was tripping in a literal way)
    # Why did we do this? So that Milene wouldn't accidentaly (or on
    # purpose, the little rascal) mark Marcel's order as delivered!!
    orders = @order_repo.undelivered_orders.select do |order|
      order.employee.id == employee.id
    end

    order = orders[order_index]
    @order_repo.mark_as_delivered(order)
  end

  ###################
  # MANAGER ACTIONS #
  ###################
  def list_undelivered_orders
    orders = @order_repo.undelivered_orders
    @view.print_orders(orders)
  end

  def add
    # indexes to find the object inside the correct array
    meal_index     = @view.ask_for_meal_index(@meal_repo.all)
    customer_index = @view.ask_for_customer_index(@customer_repo.all)
    employee_index = @view.ask_for_employee_index(@employee_repo.all_delivery_guys)

    # finding the objects on the array through the index
    meal = @meal_repo.all[meal_index]
    customer = @customer_repo.all[customer_index]
    employee = @employee_repo.all_delivery_guys[employee_index]

    # creating a new instance of Order with the objects I found previously
    order = Order.new(meal: meal, customer: customer, employee: employee)

    # adding the instance of Order to the order repository
    @order_repo.create(order)
  end
end
