defmodule Newslettex.Repo.Migrations.CreateCampaignGroups do
  use Ecto.Migration

  def change do
    create table(:campaign_groups) do
      add :name, :string

      timestamps()
    end
  end
end
