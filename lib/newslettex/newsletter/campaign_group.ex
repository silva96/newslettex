defmodule Newslettex.Newsletter.CampaignGroup do
  alias Newslettex.Newsletter.Campaign
  use Ecto.Schema
  import Ecto.Changeset

  schema "campaign_groups" do
    field :name, :string

    has_many(:campaigns, Campaign)
    timestamps()
  end

  @doc false
  def changeset(campaign_group, attrs) do
    campaign_group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
