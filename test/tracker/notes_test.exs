defmodule Tracker.NotesTest do
  use Tracker.DataCase

  alias Tracker.Notes

  describe "todos" do
    alias Tracker.Notes.Todo

    import Tracker.NotesFixtures

    @invalid_attrs %{date: nil, description: nil, done: nil, title: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Notes.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Notes.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{date: ~D[2023-01-08], description: "some description", done: true, title: "some title"}

      assert {:ok, %Todo{} = todo} = Notes.create_todo(valid_attrs)
      assert todo.date == ~D[2023-01-08]
      assert todo.description == "some description"
      assert todo.done == true
      assert todo.title == "some title"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notes.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{date: ~D[2023-01-09], description: "some updated description", done: false, title: "some updated title"}

      assert {:ok, %Todo{} = todo} = Notes.update_todo(todo, update_attrs)
      assert todo.date == ~D[2023-01-09]
      assert todo.description == "some updated description"
      assert todo.done == false
      assert todo.title == "some updated title"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Notes.update_todo(todo, @invalid_attrs)
      assert todo == Notes.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Notes.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Notes.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Notes.change_todo(todo)
    end
  end
end
