require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    @filepath = orders_csv_path

    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository

    @orders = []
    load_from_csv if File.exist?(@filepath)

    if @orders.empty?
      @next_id = 1
    else
      @next_id = @orders.last.id + 1
    end
  end

  def create(order)
    order.id = @next_id
    @orders << order
    save_csv
    @next_id += 1
  end

  def undelivered_orders
    # @orders.select { |order| !order.delivered? }
    @orders.reject { |order| order.delivered? }
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  private
  def load_from_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@filepath, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"

      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)

      @orders << Order.new(row)
    end
  end

  def save_csv
    CSV.open(@filepath, 'wb') do |csv|
      csv << ['id', 'meal_id', 'customer_id', 'employee_id', 'delivered']
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end
end
