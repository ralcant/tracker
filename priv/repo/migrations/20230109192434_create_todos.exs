defmodule Tracker.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :string
      add :description, :string
      add :done, :boolean, default: false, null: false
      add :date, :date

      timestamps()
    end
  end
end
