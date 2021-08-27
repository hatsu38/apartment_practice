module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :companies, [Types::CompanyType], null: false
    def companies
      Company.all
    end

    field :company, Types::CompanyType, null: false do
      description 'Find a company by ID'
      argument :id, ID, required: true
    end

    def company(id:)
      Company.find(id)
    end

    field :departments, [Types::DepartmentType], null: false
    def departments
      Department.all
    end

    field :department, Types::DepartmentType, null: false do
      description 'Find a deparment by ID'
      argument :id, ID, required: true
    end

    def department(id:)
      Department.find(id)
    end

    field :employees, [Types::EmployeeType], null: false
    def employees
      Employee.all
    end

    field :employee, Types::EmployeeType, null: false do
      description 'Find a employee by ID'
      argument :id, ID, required: true
    end

    def employee(id:)
      Employee.find(id)
    end
  end
end
