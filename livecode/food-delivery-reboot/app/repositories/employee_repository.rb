require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_csv if File.exist?(csv_file_path)
  end

  def all_delivery_guys
    @employees.select { |employee| employee.delivery_guy? }
  end

  def find(employee_id)
    @employees.find { |employee| employee.id == employee_id }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end


  private
  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end
end


# repo = EmployeeRepository.new('data/employees.csv')
# repo.all_delivery_guys.each do |employee|
#   puts employee.id
#   puts employee.username
#   puts employee.password
#   puts employee.role
# end

# puts repo.find(1).username
# puts repo.find_by_username("marcel").password
