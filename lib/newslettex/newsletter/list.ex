defmodule Newslettex.Newsletter.List do
  @moduledoc """
  This module is the List entity, it holds the schema to the database
  table for lists of contacts in the newsletter app.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Newslettex.Newsletter.Campaign

  schema "lists" do
    field :name, :string
    field :status, ListStatusEnum

    has_many :campaigns, Campaign
    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name, :status])
    |> validate_required([:name, :status])
  end
end
