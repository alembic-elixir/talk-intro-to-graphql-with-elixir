defmodule Todo.TodoItem do
  use Ecto.Schema

  schema "todo" do
    field :description, :string
    field :completed, :boolean, default: false
    timestamps
  end
end
