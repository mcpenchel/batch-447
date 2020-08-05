require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
# Dir["app/controllers/*.rb"].each {|file| require_relative file }
require_relative 'app/controllers/meals_controller'
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

router = Router.new(meals_controller, customers_controller, employees_controller)

# Start the app
router.run
