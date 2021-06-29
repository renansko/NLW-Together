defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation


  import_types WabanexWeb.Schema.Types.Stats

  @desc "Logic user represetation"

  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:training)
    field :statss, list_of(:stats)


  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
    field :stats, list_of(:create_stats_input)
  end
end
