defmodule TrackerWeb.NotesResolver do
  alias Tracker.Notes

  def all_todos(_root, _args, _info) do
    {:ok, Notes.list_todos()}
  end
  # TODO: Provide more insightful error message
  def create_todo(_root, args, _info) do
    case Notes.create_todo(args) do
      {:ok, todo} -> {:ok, todo}
      _error -> {:error, "Couldn't create todo :("}
    end
  end
end
