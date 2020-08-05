class Order
  attr_reader :meal, :employee, :customer
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
