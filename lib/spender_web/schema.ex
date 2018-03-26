defmodule SpenderWeb.Schema do
  use Absinthe.Schema

  alias SpenderWeb.Resolvers

  # build our queries
  query do
    field :users, list_of(:user) do
      resolve &Resolvers.User.users/3
    end

    field :user, :user do
      arg :id, :integer
      resolve &Resolvers.User.user/3
    end
  end
end