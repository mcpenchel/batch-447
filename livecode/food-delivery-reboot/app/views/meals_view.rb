class MealsView
  def ask_user_for_name
    puts "What's the name of your new meal, chef?"
    gets.chomp
  end

  def ask_user_for_price
    puts "How much is it gonna cost, chef?"
    gets.chomp.to_i
  end

  def print(meals)
    meals.each do |meal|
      puts "#{meal.id}: #{meal.name}, costs #{meal.price}"
    end
  end
end
