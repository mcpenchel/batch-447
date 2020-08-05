class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
  end

  def run
    puts "Welcome to the Food Delivery app!"
    puts "           --           "

    while @running
      @current_user = @sessions_controller.sign_in

      # while @current_user is truthy
      # so, anything BUT false or nil
      while @current_user
        if @current_user.manager?
          manager_actions
        else
          delivery_actions
        end
      end
    end
  end

  private

  def manager_actions
    display_manager_tasks
    action = gets.chomp.to_i
    print `clear`
    route_manager_action(action)
  end

  def delivery_actions
    display_delivery_tasks
    action = gets.chomp.to_i
    print `clear`
    route_delivery_action(action)
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5
      puts "TO-DO: Add a new order"
    when 6
      puts "TO-DO: List undelivered orders"
    when 7 then log_out
    when 8 then stop
    else
      puts "Please press 1, 2, 3, 4, 5, 6, 7 or 8"
    end
  end

  def route_delivery_action(action)
    case action
    when 1
      puts "TO-DO: Mark an order as delivered"
    when 2
      puts "TO-DO: List my undelivered orders"
    when 3 then log_out
    when 4 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def stop
    @current_user = nil
    @running = false
  end

  def log_out
    @current_user = nil
  end

  def display_manager_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Add a new meal"
    puts "2 - List all the meals"
    puts "3 - Add a new customer"
    puts "4 - List all the customers"
    puts "5 - Add a new order"
    puts "6 - List all the undelivered orders"
    puts "7 - Log out"
    puts "8 - Stop and exit the program"
    print "> "
  end

  def display_delivery_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Mark an order as delivered"
    puts "2 - List my undelivered orders"
    puts "3 - Log out"
    puts "4 - Stop and exit the program"
    print "> "
  end
end
