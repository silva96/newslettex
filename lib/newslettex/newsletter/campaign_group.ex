defmodule Newslettex.Newsletter.CampaignGroup do
  @moduledoc """
  This module is the CampaignGroup entity, it holds the schema to the database
  table for campaign_groups in the newsletter app.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Newslettex.Newsletter.Campaign

  schema "campaign_groups" do
    field :name, :string

    has_many :campaigns, Campaign
    timestamps()
  end

  @doc false
  def changeset(campaign_group, attrs) do
    campaign_group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
