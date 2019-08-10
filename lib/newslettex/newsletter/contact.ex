defmodule Newslettex.Newsletter.Contact do
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
