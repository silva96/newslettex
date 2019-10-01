defmodule Newslettex.Newsletter.Contact do
  @moduledoc """
  This module is the Contact entity, it holds the schema to the database
  table for contacts in the newsletter app.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Newslettex.Newsletter.List

  schema "contacts" do
    field :email, :string
    field :unsuscribed, :boolean, default: false

    belongs_to :list, List

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:email, :unsuscribed])
    |> validate_required([:email, :unsuscribed])
  end
end
