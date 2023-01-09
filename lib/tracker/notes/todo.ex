defmodule Tracker.Notes.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :date, :date
    field :description, :string
    field :done, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :description, :done, :date])
    |> validate_required([:title, :description, :done, :date])
  end
end
