defmodule Todo.TodoContext do
  @moduledoc """
  The boundary for the Todo API.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias Todo.Repo

  alias Todo.TodoItem 

  def all do
    TodoItem |> Repo.all
  end
end
