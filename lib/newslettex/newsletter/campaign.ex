defmodule Newslettex.Newsletter.Campaign do
  @moduledoc """
  This module is the Campaign entity, it holds the schema to the database
  table for campaigns in the newsletter app.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Newslettex.Newsletter.CampaignGroup
  alias Newslettex.Newsletter.List
  alias Newslettex.Newsletter.CampaignContactEvent

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
    field :status, CampaignStatusEnum, default: :draft
    field :subject, :string
    field :unique_clicked, :integer
    field :unique_opened, :integer

    belongs_to :campaign_group, CampaignGroup
    belongs_to :list, List
    has_many :campaign_contact_events, CampaignContactEvent

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
      :status
    ])
  end
end
