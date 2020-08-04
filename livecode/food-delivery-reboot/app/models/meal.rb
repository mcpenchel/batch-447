class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end

# lasagna = Meal.new(name: "Secret Lasagna", price: 20)

# puts lasagna.name
# puts lasagna.price
# puts lasagna.id
