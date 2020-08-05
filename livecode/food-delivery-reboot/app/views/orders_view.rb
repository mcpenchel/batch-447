class OrdersView
  def ask_for_meal_index(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}"
    end

    puts "Which one do you want? Give me the number"
    gets.chomp.to_i - 1
  end

  def ask_for_employee_index(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end

    puts "Which one do you want? Give me the number"
    gets.chomp.to_i - 1
  end

  def ask_for_customer_index(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name}"
    end

    puts "Which one do you want? Give me the number"
    gets.chomp.to_i - 1
  end

  def print_orders(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} to #{order.customer.name}, delivered by #{order.employee.username}"
    end
  end

  def ask_for_order_index
    puts "Which order did you just deliver? Be honest with me."
    gets.chomp.to_i - 1
  end
end
