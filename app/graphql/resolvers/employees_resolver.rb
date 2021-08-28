module Resolvers
  class EmployeesResolver < Resolvers::BaseResolver
    type [Types::EmployeeType], null: false

    def resolve
      Employee.all
    end
  end
end