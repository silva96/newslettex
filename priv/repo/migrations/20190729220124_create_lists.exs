defmodule Newslettex.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    ListStatusEnum.create_type()

    create table(:lists) do
      add :name, :string
      add :status, ListStatusEnum.type()

      timestamps()
    end
  end
end
