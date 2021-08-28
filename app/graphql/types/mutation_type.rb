module Types
  class MutationType < Types::BaseObject
    field :create_company, mutation: Mutations::Companies::Create
  end
end
