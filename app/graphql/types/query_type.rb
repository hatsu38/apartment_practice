module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :companies, [Types::CompanyType],
                  null: false,
                  resolver: Resolvers::CompaniesResolver,
                  description: "All companies."

    field :company, Types::CompanyType,
                  null: false,
                  resolver: Resolvers::CompanyResolver,
                  description: "Find a company by Id."

    field :departments, [Types::DepartmentType],
                  null: false,
                  resolver: Resolvers::DepartmentsResolver,
                  description: "All departments."

    field :department, Types::DepartmentType,
                  null: false,
                  resolver: Resolvers::DepartmentResolver,
                  description: "Find a department by Id."

    field :employees, [Types::EmployeeType],
                  null: false,
                  resolver: Resolvers::EmployeesResolver,
                  description: "All employees."

    field :employee, Types::EmployeeType,
                  null: false,
                  resolver: Resolvers::EmployeeResolver,
                  description: "Find a employee by Id."
  end
end
