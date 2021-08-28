module Resolvers
  class DepartmentsResolver < Resolvers::BaseResolver
    type [Types::DepartmentType], null: false

    def resolve
      Department.all
    end
  end
end