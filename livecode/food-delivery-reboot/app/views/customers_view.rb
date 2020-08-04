class CustomersView
  def ask_user_for_name
    puts "What's the name of your customer, chef?"
    gets.chomp
  end

  def ask_user_for_address
    puts "Where is your costumer living, chef?"
    gets.chomp
  end

  def print(customers)
    customers.each do |customer|
      puts "#{customer.id}: #{customer.name}, living at #{customer.address}"
    end
  end
end
