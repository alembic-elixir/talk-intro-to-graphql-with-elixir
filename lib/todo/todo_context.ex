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
    {:ok, todo_item |> Repo.insert!}
  end
end
