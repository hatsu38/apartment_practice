module Resolvers
  class CompaniesResolver < Resolvers::BaseResolver
    type [Types::CompanyType], null: false

    def resolve
      Company.all
    end
  end
end