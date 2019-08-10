defmodule Newslettex.Repo.Migrations.CreateCampaignContactEvents do
  use Ecto.Migration

  def change do
    CampaignContactEventTypeEnum.create_type()

    create table(:campaign_contact_events) do
      add :event_type, CampaignContactEventTypeEnum.type()
      add :smtp_message_id, :string
      add :campaign_id, references(:campaigns, on_delete: :nothing)
      add :contact_id, references(:contacts, on_delete: :nothing)

      timestamps()
    end

    create index(:campaign_contact_events, [:campaign_id])
    create index(:campaign_contact_events, [:contact_id])
  end
end
