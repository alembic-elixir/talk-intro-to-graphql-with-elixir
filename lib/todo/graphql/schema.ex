defmodule Todo.GraphQL.Schema do
  use Absinthe.Schema

  alias Todo.TodoContext

  import_types Absinthe.Type.Custom

  query do
    @desc "Get the list of todo items"
    field :todo_items, type: list_of(:todo_item) do
      resolve fn _, _ ->
        {:ok, TodoContext.all_todo_items}
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

  @desc "mutations to support CRUD operations on todo items"
  mutation do
    @desc "Create a todo item"
    field :create_todo_item, type: :todo_item do
      @desc "The description of the todo item"
      arg :description, non_null(:string)

      resolve &TodoContext.create_todo_item/2
    end
  end
end

