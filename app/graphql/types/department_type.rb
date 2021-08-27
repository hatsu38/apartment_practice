module Types
  class DepartmentType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :employees, [Types::EmployeeType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
