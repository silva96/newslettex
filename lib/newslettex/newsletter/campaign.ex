defmodule Newslettex.Newsletter.Campaign do
  alias Newslettex.Newsletter.CampaignGroup
  alias Newslettex.Newsletter.List
  use Ecto.Schema
  import Ecto.Changeset

  schema "campaigns" do
    field :body, :string
    field :bounced, :integer
    field :clicked, :integer
    field :complained, :integer
    field :contacts_size, :integer
    field :delivered, :integer
    field :name, :string
    field :opened, :integer
    field :rejected, :integer
    field :sender, :string
    field :sent, :integer
    field :smtp_message_id, :string
    field :status, CampaignStatusEnum
    field :subject, :string
    field :unique_clicked, :integer
    field :unique_opened, :integer

    belongs_to :campaign_group, CampaignGroup
    belongs_to :list, List

    timestamps()
  end

  @doc false
  def changeset(campaign, attrs) do
    campaign
    |> cast(attrs, [
      :name,
      :sender,
      :subject,
      :body,
      :status,
      :smtp_message_id,
      :sent,
      :delivered,
      :opened,
      :clicked,
      :unique_opened,
      :unique_clicked,
      :bounced,
      :complained,
      :rejected,
      :contacts_size
    ])
    |> validate_required([
      :name,
      :sender,
      :subject,
      :body,
      :status,
      :smtp_message_id,
      :sent,
      :delivered,
      :opened,
      :clicked,
      :unique_opened,
      :unique_clicked,
      :bounced,
      :complained,
      :rejected,
      :contacts_size
    ])
  end
end
