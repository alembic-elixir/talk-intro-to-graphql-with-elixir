defmodule Todo.TodoContext do
  @moduledoc """
  The boundary for the Todo API.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias Todo.Repo

  alias Todo.TodoItem 

  def all_todo_items do
    TodoItem |> Repo.all
  end

  def create_todo_item(args, _) do
    todo_item = %TodoItem{description: args.description}
    todo_item |> Repo.insert
  end

  def complete_todo_item(args, _) do
    todo_item = TodoItem |> where(id: ^args.id) |> Repo.one
    case todo_item do
      nil -> { :error, "not found" }
      todo_item -> todo_item |> change(completed: true) |> Repo.update
    end
  end

  def delete_todo_item(args, _) do
    todo_item = TodoItem |> where(id: ^args.id) |> Repo.one
    case todo_item do
      nil -> { :error, "not found" }
      todo_item -> todo_item |> Repo.delete
    end
  end
end
