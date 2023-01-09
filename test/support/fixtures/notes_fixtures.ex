defmodule Tracker.NotesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tracker.Notes` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        date: ~D[2023-01-08],
        description: "some description",
        done: true,
        title: "some title"
      })
      |> Tracker.Notes.create_todo()

    todo
  end
end
