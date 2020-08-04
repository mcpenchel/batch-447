require_relative '../models/customer'
require 'csv'

class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers = []
    load_from_csv if File.exist?(csv_file_path)

    if @customers.empty?
      @next_id = 1
    else
      @next_id = @customers.last.id + 1
    end
  end

  def find(customer_id)
    @customers.find { |customer| customer.id == customer_id }
  end

  def all
    @customers
  end

  def create(customer)
    customer.id = @next_id
    @customers << customer
    save_csv
    @next_id += 1
  end

  private

  def load_from_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'address']
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
