module Resolvers
  class EmployeeResolver < Resolvers::BaseResolver
    description 'Find a Employee by ID'
    type Types::EmployeeType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Employee.find(id)
    end
  end
end