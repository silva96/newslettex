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

  describe "CampaignStatusEnum" do
    alias Newslettex.Newsletter.Campaign

    test "it has the correct map values" do
      assert CampaignStatusEnum.__enum_map__() == [:draft, :sending, :sent]
    end

    test "raises when input is not in the enum map" do
      error = {:status, {"is invalid", [type: CampaignStatusEnum, validation: :cast]}}
      changeset = Ecto.Changeset.cast(%Campaign{}, %{"status" => "a_not_valid_status"}, [:status])
      assert error in changeset.errors
    end

    test "doesn't raise when input is in the enum map" do
      changeset = Ecto.Changeset.cast(%Campaign{}, %{"status" => "draft"}, [:status])
      assert length(changeset.errors) == 0
      changeset = Ecto.Changeset.cast(%Campaign{}, %{"status" => :sent}, [:status])
      assert length(changeset.errors) == 0
    end
  end

  describe "CampaignContactEventTypeEnum" do
    alias Newslettex.Newsletter.CampaignContactEvent

    test "it has the correct map values" do
      assert CampaignContactEventTypeEnum.__enum_map__() == [
               :send,
               :delivery,
               :open,
               :click,
               :bounce,
               :complaint,
               :reject
             ]
    end

    test "raises when input is not in the enum map" do
      error =
        {:event_type, {"is invalid", [type: CampaignContactEventTypeEnum, validation: :cast]}}

      changeset =
        Ecto.Changeset.cast(
          %CampaignContactEvent{},
          %{"event_type" => "a_not_valid_event_type"},
          [:event_type]
        )

      assert error in changeset.errors
    end

    test "doesn't raise when input is in the enum map" do
      changeset =
        Ecto.Changeset.cast(%CampaignContactEvent{}, %{"event_type" => "send"}, [:event_type])

      assert length(changeset.errors) == 0

      changeset =
        Ecto.Changeset.cast(%CampaignContactEvent{}, %{"event_type" => :reject}, [:event_type])

      assert length(changeset.errors) == 0
    end
  end
end
