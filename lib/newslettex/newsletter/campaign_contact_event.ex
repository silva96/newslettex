defmodule Newslettex.Newsletter.CampaignContactEvent do
  @moduledoc """
  This module is the CampaignContactEvent entity, it holds the schema to the database
  table for campaign_contact_events in the newsletter app.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Newslettex.Newsletter.Contact
  alias Newslettex.Newsletter.Campaign

  schema "campaign_contact_events" do
    field :event_type, CampaignContactEventTypeEnum
    field :smtp_message_id, :string

    belongs_to :campaign, Campaign
    belongs_to :contact, Contact

    timestamps()
  end

  @doc false
  def changeset(campaign_contact_event, attrs) do
    campaign_contact_event
    |> cast(attrs, [:event_type, :smtp_message_id])
    |> validate_required([:event_type, :smtp_message_id])
  end
end
