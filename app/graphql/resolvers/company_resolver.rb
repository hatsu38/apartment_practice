module Resolvers
  class CompanyResolver < Resolvers::BaseResolver
    description 'Find a company by ID'
    type Types::CompanyType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Company.find(id)
    end
  end
end