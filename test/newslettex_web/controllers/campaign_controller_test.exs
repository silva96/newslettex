defmodule NewslettexWeb.CampaignControllerTest do
  use NewslettexWeb.ConnCase

  alias Newslettex.Newsletter

  @create_attrs %{
    body: "some body",
    bounced: 42,
    clicked: 42,
    complained: 42,
    contacts_size: 42,
    delivered: 42,
    name: "some name",
    opened: 42,
    rejected: 42,
    sender: "some sender",
    sent: 42,
    smtp_message_id: "some smtp_message_id",
    status: :draft,
    subject: "some subject",
    unique_clicked: 42,
    unique_opened: 42
  }
  @update_attrs %{
    body: "some updated body",
    bounced: 43,
    clicked: 43,
    complained: 43,
    contacts_size: 43,
    delivered: 43,
    name: "some updated name",
    opened: 43,
    rejected: 43,
    sender: "some updated sender",
    sent: 43,
    smtp_message_id: "some updated smtp_message_id",
    status: :sending,
    subject: "some updated subject",
    unique_clicked: 43,
    unique_opened: 43
  }
  @invalid_attrs %{
    body: nil,
    bounced: nil,
    clicked: nil,
    complained: nil,
    contacts_size: nil,
    delivered: nil,
    name: nil,
    opened: nil,
    rejected: nil,
    sender: nil,
    sent: nil,
    smtp_message_id: nil,
    status: nil,
    subject: nil,
    unique_clicked: nil,
    unique_opened: nil
  }

  def fixture(:campaign) do
    {:ok, campaign} = Newsletter.create_campaign(@create_attrs)
    campaign
  end

  describe "index" do
    test "lists all campaigns", %{conn: conn} do
      conn = get(conn, Routes.campaign_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Campaigns"
    end
  end

  describe "new campaign" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.campaign_path(conn, :new))
      assert html_response(conn, 200) =~ "New Campaign"
    end
  end

  describe "create campaign" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.campaign_path(conn, :create), campaign: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.campaign_path(conn, :show, id)

      conn = get(conn, Routes.campaign_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Campaign"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.campaign_path(conn, :create), campaign: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Campaign"
    end
  end

  describe "edit campaign" do
    setup [:create_campaign]

    test "renders form for editing chosen campaign", %{conn: conn, campaign: campaign} do
      conn = get(conn, Routes.campaign_path(conn, :edit, campaign))
      assert html_response(conn, 200) =~ "Edit Campaign"
    end
  end

  describe "update campaign" do
    setup [:create_campaign]

    test "redirects when data is valid", %{conn: conn, campaign: campaign} do
      conn = put(conn, Routes.campaign_path(conn, :update, campaign), campaign: @update_attrs)
      assert redirected_to(conn) == Routes.campaign_path(conn, :show, campaign)

      conn = get(conn, Routes.campaign_path(conn, :show, campaign))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, campaign: campaign} do
      conn = put(conn, Routes.campaign_path(conn, :update, campaign), campaign: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Campaign"
    end
  end

  describe "delete campaign" do
    setup [:create_campaign]

    test "deletes chosen campaign", %{conn: conn, campaign: campaign} do
      conn = delete(conn, Routes.campaign_path(conn, :delete, campaign))
      assert redirected_to(conn) == Routes.campaign_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.campaign_path(conn, :show, campaign))
      end
    end
  end

  defp create_campaign(_) do
    campaign = fixture(:campaign)
    {:ok, campaign: campaign}
  end
end
