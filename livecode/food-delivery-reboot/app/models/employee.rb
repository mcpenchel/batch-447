class Employee
  attr_reader :id, :username, :password, :role
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def delivery_guy?
    @role == "delivery_guy"
  end

  def manager?
    @role == "manager"
  end
end

# milene = Employee.new(id: 1, username: "milene.french",
#                       password: "pretzel", role: "delivery_guy")

# matheus = Employee.new(id: 2, username: "mastodon.matt",
#                       password: "mastodon", role: "manager")

# puts milene.id
# puts milene.username
# puts milene.password
# puts milene.role

# puts matheus.id
# puts matheus.username
# puts matheus.password
# puts matheus.role
