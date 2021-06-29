defmodule Wabanex.Stats do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:altura, :peso, :gordura, :massa_magra]

schema "stats" do
  field :altura, :float
  field :peso, :float
  field :gordura, :string
  field :massa_magra, :string

  belongs_to :user, User

  timestamps()

end

def changeset(params) do
  %__MODULE__{}
  |> cast(params, @fields)
  |> validate_number(:altura, greater_than: 0)
  |> validate_number(:peso, greater_than: 0)

end
end
