defmodule TrackerWeb.NotesResolver do
  alias Tracker.Notes

  def all_todos(_root, args, _info) do
    {:ok, Notes.list_todos(args.filters)}
  end
  # TODO: Provide more insightful error message
  def create_todo(_root, args, _info) do
    case Notes.create_todo(args) do
      {:ok, todo} -> {:ok, todo}
      _error -> {:error, "Couldn't create todo :("}
    end
  end

  def delete_todo(_root, %{id: id}, _info) do
    case Notes.delete_todo_by_id(id) do
      {:ok, struct} -> {:ok, struct}
      _error -> {:error, "Couldn't delete todo :("}
    end
  end

  def complete_todo(_root, %{id: id}, _info) do
    case Notes.complete_todo(id) do
      {:ok, struct} -> {:ok, struct}
      _error -> {:error, "Couldn't complete todo :("}
    end
  end
end
