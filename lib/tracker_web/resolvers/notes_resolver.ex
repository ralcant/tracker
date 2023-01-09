defmodule TrackerWeb.NotesResolver do
  alias Tracker.Notes

  def all_todos(_root, _args, _info) do
    {:ok, Notes.list_todos()}
  end
end
