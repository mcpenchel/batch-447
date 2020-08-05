require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/order_repository'
# Dir["app/controllers/*.rb"].each {|file| require_relative file }
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/orders_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'router'

MEAL_CSV_FILE = File.join(File.dirname(__FILE__), 'data/meals.csv')
meal_repo = MealRepository.new(MEAL_CSV_FILE)
meals_controller = MealsController.new(meal_repo)

CUSTOMER_CSV_FILE = File.join(File.dirname(__FILE__), 'data/customers.csv')
customer_repo = CustomerRepository.new(CUSTOMER_CSV_FILE)
customers_controller = CustomersController.new(customer_repo)

EMPLOYEE_CSV_FILE = File.join(File.dirname(__FILE__), 'data/employees.csv')
employee_repo = EmployeeRepository.new(EMPLOYEE_CSV_FILE)
employees_controller = SessionsController.new(employee_repo)

ORDER_CSV_FILE = File.join(File.dirname(__FILE__), 'data/orders.csv')
order_repo = OrderRepository.new(ORDER_CSV_FILE, meal_repo, customer_repo, employee_repo)
orders_controller = OrdersController.new(meal_repo, customer_repo, employee_repo, order_repo)

router = Router.new(meals_controller, customers_controller, employees_controller, orders_controller)

# Start the app
router.run
