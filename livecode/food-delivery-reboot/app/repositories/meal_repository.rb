require_relative '../models/meal'
require 'csv'

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    load_from_csv if File.exist?(csv_file_path)

    if @meals.empty?
      @next_id = 1
    else
      @next_id = @meals.last.id + 1
    end
  end

  def find(meal_id)
    @meals.find { |meal| meal.id == meal_id }
  end

  def all
    @meals
  end

  def create(meal)
    meal.id = @next_id
    @meals << meal
    save_csv
    @next_id += 1
  end

  private

  def load_from_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end

# repo = MealRepository.new('data/meals.csv')

# meal = Meal.new(name: "PF - Rice, beans, beef", price: 10)

# repo.create(meal)

# repo.all.each do |meal|
#   puts "#{meal.id}: #{meal.name}, costs #{meal.price}"
# end

# repo.all.each do |meal|
#   puts "#{meal.name}, costs #{meal.price}"
# end

# meal = repo.find(3)
# puts meal.name
