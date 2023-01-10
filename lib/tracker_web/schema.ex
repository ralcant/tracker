defmodule TrackerWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom
  alias TrackerWeb.NotesResolver
  # Absinthe.Type.InputObject


  object :todo do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :description, non_null(:string)
    field :date, non_null(:date)
    field :done, non_null(:boolean)
  end
  #to make sure "order" is a valid value
  #In graphql this should be input as ASC or DESC (no quotations)
  enum :filter_order do
    value :asc
    value :desc
  end
  input_object :todo_filter do
    field :title, :string
    field :order, :filter_order
  end
  query do
    @desc "Get all todos"
    field :all_todos, non_null(list_of(non_null(:todo))) do
      arg :filters, non_null(:todo_filter)
      resolve(&NotesResolver.all_todos/3)
    end
  end

  mutation do
    @desc "Create a new todo"
    field :create_todo, non_null(:todo) do
      arg :title, non_null(:string)
      arg :description, non_null(:string)
      arg :date, non_null(:date)
      arg :done, non_null(:boolean)

      resolve(&NotesResolver.create_todo/3)
    end

    @desc "Delete a todo by its id"
    field :delete_todo, :todo do
      arg :id, non_null(:id)

      resolve(&NotesResolver.delete_todo/3)
    end
    @desc "Mark a todo as completed"
    field :complete_todo, :todo do
      arg :id, non_null(:id)

      resolve(&NotesResolver.complete_todo/3)
    end
  end
end
