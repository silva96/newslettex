defmodule NewslettexWeb.CampaignContactEventControllerTest do
  use NewslettexWeb.ConnCase

  alias Newslettex.Newsletter

  @create_attrs %{event_type: :send, smtp_message_id: "some smtp_message_id"}
  @update_attrs %{event_type: :delivery, smtp_message_id: "some updated smtp_message_id"}
  @invalid_attrs %{event_type: nil, smtp_message_id: nil}

  def fixture(:campaign_contact_event) do
    {:ok, campaign_contact_event} = Newsletter.create_campaign_contact_event(@create_attrs)
    campaign_contact_event
  end

  describe "index" do
    test "lists all campaign_contact_events", %{conn: conn} do
      conn = get(conn, Routes.campaign_contact_event_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Campaign contact events"
    end
  end

  describe "new campaign_contact_event" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.campaign_contact_event_path(conn, :new))
      assert html_response(conn, 200) =~ "New Campaign contact event"
    end
  end

  describe "create campaign_contact_event" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.campaign_contact_event_path(conn, :create),
          campaign_contact_event: @create_attrs
        )

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.campaign_contact_event_path(conn, :show, id)

      conn = get(conn, Routes.campaign_contact_event_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Campaign contact event"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.campaign_contact_event_path(conn, :create),
          campaign_contact_event: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "New Campaign contact event"
    end
  end

  describe "edit campaign_contact_event" do
    setup [:create_campaign_contact_event]

    test "renders form for editing chosen campaign_contact_event", %{
      conn: conn,
      campaign_contact_event: campaign_contact_event
    } do
      conn = get(conn, Routes.campaign_contact_event_path(conn, :edit, campaign_contact_event))
      assert html_response(conn, 200) =~ "Edit Campaign contact event"
    end
  end

  describe "update campaign_contact_event" do
    setup [:create_campaign_contact_event]

    test "redirects when data is valid", %{
      conn: conn,
      campaign_contact_event: campaign_contact_event
    } do
      conn =
        put(conn, Routes.campaign_contact_event_path(conn, :update, campaign_contact_event),
          campaign_contact_event: @update_attrs
        )

      assert redirected_to(conn) ==
               Routes.campaign_contact_event_path(conn, :show, campaign_contact_event)

      conn = get(conn, Routes.campaign_contact_event_path(conn, :show, campaign_contact_event))
      assert html_response(conn, 200) =~ "some updated smtp_message_id"
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      campaign_contact_event: campaign_contact_event
    } do
      conn =
        put(conn, Routes.campaign_contact_event_path(conn, :update, campaign_contact_event),
          campaign_contact_event: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Campaign contact event"
    end
  end

  describe "delete campaign_contact_event" do
    setup [:create_campaign_contact_event]

    test "deletes chosen campaign_contact_event", %{
      conn: conn,
      campaign_contact_event: campaign_contact_event
    } do
      conn =
        delete(conn, Routes.campaign_contact_event_path(conn, :delete, campaign_contact_event))

      assert redirected_to(conn) == Routes.campaign_contact_event_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.campaign_contact_event_path(conn, :show, campaign_contact_event))
      end
    end
  end

  defp create_campaign_contact_event(_) do
    campaign_contact_event = fixture(:campaign_contact_event)
    {:ok, campaign_contact_event: campaign_contact_event}
  end
end
