defmodule Newslettex.Newsletter.List do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lists" do
    field :name, :string
    field :status, ListStatusEnum

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name, :status])
    |> validate_required([:name, :status])
  end
end
