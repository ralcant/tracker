defmodule TrackerWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom
  alias TrackerWeb.NotesResolver

  object :todo do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :description, non_null(:string)
    field :date, non_null(:date)
    field :done, non_null(:boolean)
  end

  query do
    @desc "Get all todos"
    field :all_todos, non_null(list_of(non_null(:todo))) do
      resolve(&NotesResolver.all_todos/3)
    end
  end
end
