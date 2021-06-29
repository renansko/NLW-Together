defmodule WabanexWeb.Schema.Types.Stats do
  use Absinthe.Schema.Notation

  @desc "Logic exercise represetation"

  object :stats do
    field :id, non_null(:uuid4)
    field :altura, non_null(:float)
    field :peso, non_null(:float)
    field :gordura, non_null(:string)
    field :massa_magra, non_null(:string)
  end
  input_object :create_stats_input do
    field :altura, non_null(:float), description: "Altura user"
    field :peso, non_null(:float), description: "Peso do user"
    field :gordura, non_null(:string), description: "Gordura do user"
    field :massa_magra, non_null(:string), description: "massa_magra user"
  end
end
