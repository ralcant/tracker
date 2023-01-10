defmodule Tracker.Notes do
  @moduledoc """
  The Notes context.
  """

  import Ecto.Query, warn: false
  alias Tracker.Repo

  alias Tracker.Notes.Todo

  # def list_todos() do
  #   Repo.all(Todo)
  # end
  @doc """
  Returns the list of todos with possibly filtering and/or sorting by date
   For example, args = [{:order, :desc}, {:title, "filtering text"}]
   The value of "order" should only be :desc or :asc
  """
  def list_todos(args) do
    args
    |> Enum.reduce(Todo, fn
      {:order, order}, query -> query |> order_by({^order, :date})
      {:title, title}, query -> from q in query, where: ilike(q.title, ^"%#{title}%")
    end)
    |> Repo.all
  end
  @doc """
  filter = list of queries
  """
  # def filter_with(query, filter) do
  #   Enum.reduce(filter, query, fn
  #      {:title, title}, query -> from q in query, where: ilike(q.title, ^"%#{title}%")
  #   end)
  # end
  # def order_todos(todos, desc) do
  #   if desc do
  #     from(p in todos, order_by: p.date)
  #   else

  #   end
  # end

  @doc """
  Gets a single todo.

  Raises `Ecto.NoResultsError` if the Todo does not exist.

  ## Examples

      iex> get_todo!(123)
      %Todo{}

      iex> get_todo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo!(id), do: Repo.get!(Todo, id)

  @doc """
  Creates a todo.

  ## Examples

      iex> create_todo(%{field: value})
      {:ok, %Todo{}}

      iex> create_todo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo(attrs \\ %{}) do
    %Todo{}
    |> Todo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todo.

  ## Examples

      iex> update_todo(todo, %{field: new_value})
      {:ok, %Todo{}}

      iex> update_todo(todo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo(%Todo{} = todo, attrs) do
    todo
    |> Todo.changeset(attrs)
    |> Repo.update()
  end
  @doc """
  Completes a todo by setting its 'done' attribute
  to true.
  """
  def complete_todo(id) do
    todo = Repo.get(Todo, id)
    #TODO: Check if the todo has already been completed
    case update_todo(todo, %{done: true}) do
      {:ok, struct} -> {:ok, struct}
      {:error, changeset} -> {:error, changeset}
    end
  end
  @doc """
  Deletes a todo.

  ## Examples

      iex> delete_todo(todo)
      {:ok, %Todo{}}

      iex> delete_todo(todo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo(%Todo{} = todo) do
    Repo.delete(todo)
  end

  def delete_todo_by_id(id) do
    todo = Repo.get(Todo, id)
    case Repo.delete(todo) do
      {:ok, struct} -> {:ok, struct}
      {:error, changeset} -> {:error, changeset}
    end
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo changes.

  ## Examples

      iex> change_todo(todo)
      %Ecto.Changeset{data: %Todo{}}

  """
  def change_todo(%Todo{} = todo, attrs \\ %{}) do
    Todo.changeset(todo, attrs)
  end
end
