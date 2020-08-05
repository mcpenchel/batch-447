require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    username = @view.ask_for("username")
    password = @view.ask_for("password")

    employee = @employee_repository.find_by_username(username)

    return employee if employee && employee.password == password

    @view.wrong_credentials
    sign_in
  end
end
