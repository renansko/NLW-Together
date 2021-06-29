defmodule Wabanex.Repo.Migrations.CreateStatsTable do
  use Ecto.Migration

  def change do
    create table(:stats) do
      add :altura, :float
      add :peso, :float
      add :gordura, :string
      add :massa_magra, :string
      add :user_id, references(:users)

      timestamps()
    end
  end
end
