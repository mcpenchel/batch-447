require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'router'

CSV_FILE = File.join(File.dirname(__FILE__), 'data/meals.csv')
meal_repo = MealRepository.new(CSV_FILE)
meals_controller = MealsController.new(meal_repo)


customer_csv = File.join(File.dirname(__FILE__), 'data/customers.csv')
customer_repo = CustomerRepository.new(customer_csv)
customers_controller = CustomersController.new(customer_repo)

router = Router.new(meals_controller, customers_controller)

# Start the app
router.run
