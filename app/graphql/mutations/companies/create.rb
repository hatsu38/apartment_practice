module Mutations
  class Companies::Create < BaseMutation
    field :company, Types::CompanyType, null: false

    argument :name, String, required: true
    argument :subdomain, String, required: true

    def resolve(**params)
      company = Company.create!(params)
      { company: company }
    end
  end
end
