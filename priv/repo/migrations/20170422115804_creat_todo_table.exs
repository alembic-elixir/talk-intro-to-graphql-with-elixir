defmodule Todo.Repo.Migrations.CreatTodoTable do
  use Ecto.Migration

  def change do
    create table(:todo) do
      add :description, :string, null: false
      add :completed, :boolean, null: false

      timestamps()
    end
  end
end
