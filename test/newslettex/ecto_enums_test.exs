defmodule Newslettex.EctoEnumsTest do
  use Newslettex.DataCase

  describe "ListStatusEnum" do
    alias Newslettex.Newsletter.List

    test "it has the correct map values" do
      assert ListStatusEnum.__enum_map__() == [:importing, :imported]
    end

    test "raises when input is not in the enum map" do
      error = {:status, {"is invalid", [type: ListStatusEnum, validation: :cast]}}
      changeset = Ecto.Changeset.cast(%List{}, %{"status" => "a_not_valid_status"}, [:status])
      assert error in changeset.errors
    end

    test "doesn't raise when input is in the enum map" do
      changeset = Ecto.Changeset.cast(%List{}, %{"status" => "importing"}, [:status])
      assert length(changeset.errors) == 0
      changeset = Ecto.Changeset.cast(%List{}, %{"status" => :importing}, [:status])
      assert length(changeset.errors) == 0
    end
  end
end
