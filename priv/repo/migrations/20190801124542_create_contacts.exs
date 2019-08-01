defmodule Newslettex.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :email, :string
      add :unsuscribed, :boolean, default: false, null: false
      add :list_id, references(:lists, on_delete: :nothing)

      timestamps()
    end

    create index(:contacts, [:list_id])
  end
end
