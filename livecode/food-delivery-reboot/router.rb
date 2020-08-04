class Router
  def initialize(meals_controller, customers_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    puts "Welcome to the Food Delivery app!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then stop
    else
      puts "Please press 1, 2 or 3"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Add a new meal"
    puts "2 - List all the meals"
    puts "3 - Add a new customer"
    puts "4 - List all the customers"
    puts "5 - Stop and exit the program"
    print "> "
  end
end
