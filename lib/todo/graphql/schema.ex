defmodule Todo.GraphQL.Schema do
  use Absinthe.Schema

  alias Todo.TodoItem

  # TODO do we need this line?
  import_types Absinthe.Type.Custom

  query do
    @desc "Get the list of todo items"
    field :todo_items, type: list_of(:todo_item) do
      resolve fn _, _ ->
        {:ok, TodoItem.all}
      end
    end
  end

  @desc "A todo item"
  object :todo_item do
    @desc "The description of the todo item"
    field :description, :string

    @desc "Whether the todo item has been completed or not"
    field :completed, :boolean

    @desc "The creation time of the todo item"
    field :inserted_at, :date
  end
end

