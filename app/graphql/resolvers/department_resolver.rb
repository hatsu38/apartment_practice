module Resolvers
  class DepartmentResolver < Resolvers::BaseResolver
    description 'Find a Department by ID'
    type Types::DepartmentType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Department.find(id)
    end
  end
end