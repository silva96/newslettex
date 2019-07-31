defmodule Newslettex.Repo.Migrations.CreateCampaigns do
  use Ecto.Migration

  def change do
    CampaignStatusEnum.create_type()

    create table(:campaigns) do
      add :name, :string
      add :sender, :string
      add :subject, :string
      add :body, :text
      add :status, CampaignStatusEnum.type(), default: "draft"
      add :smtp_message_id, :string
      add :sent, :integer, default: 0
      add :delivered, :integer, default: 0
      add :opened, :integer, default: 0
      add :clicked, :integer, default: 0
      add :unique_opened, :integer, default: 0
      add :unique_clicked, :integer, default: 0
      add :bounced, :integer, default: 0
      add :complained, :integer, default: 0
      add :rejected, :integer, default: 0
      add :contacts_size, :integer, default: 0
      add :campaign_group_id, references(:campaign_groups, on_delete: :nothing)
      add :list_id, references(:lists, on_delete: :nothing)

      timestamps()
    end

    create index(:campaigns, [:campaign_group_id])
  end
end
