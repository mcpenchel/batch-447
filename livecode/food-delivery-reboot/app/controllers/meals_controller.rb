require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # Ask the user for the name of the meal
    name = @view.ask_user_for_name
    # Ask the user for the price of the meal
    price = @view.ask_user_for_price
    # 3) Instantiate an object of the Meal class
    meal = Meal.new(name: name, price: price)
    # Execute the MealRepository.create sending the object from step 3
    @meal_repository.create(meal)
  end

  def list
    # Get the array of meals from the MealRepository object
    meals = @meal_repository.all
    # Sent it to the view, which will loop over and print the attributes
    @view.print(meals)
  end
end
