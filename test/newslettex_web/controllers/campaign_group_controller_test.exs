defmodule NewslettexWeb.CampaignGroupControllerTest do
  use NewslettexWeb.ConnCase

  alias Newslettex.Newsletter

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:campaign_group) do
    {:ok, campaign_group} = Newsletter.create_campaign_group(@create_attrs)
    campaign_group
  end

  describe "index" do
    test "lists all campaign_groups", %{conn: conn} do
      conn = get(conn, Routes.campaign_group_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Campaign groups"
    end
  end

  describe "new campaign_group" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.campaign_group_path(conn, :new))
      assert html_response(conn, 200) =~ "New Campaign group"
    end
  end

  describe "create campaign_group" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.campaign_group_path(conn, :create), campaign_group: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.campaign_group_path(conn, :show, id)

      conn = get(conn, Routes.campaign_group_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Campaign group"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.campaign_group_path(conn, :create), campaign_group: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Campaign group"
    end
  end

  describe "edit campaign_group" do
    setup [:create_campaign_group]

    test "renders form for editing chosen campaign_group", %{
      conn: conn,
      campaign_group: campaign_group
    } do
      conn = get(conn, Routes.campaign_group_path(conn, :edit, campaign_group))
      assert html_response(conn, 200) =~ "Edit Campaign group"
    end
  end

  describe "update campaign_group" do
    setup [:create_campaign_group]

    test "redirects when data is valid", %{conn: conn, campaign_group: campaign_group} do
      conn =
        put(conn, Routes.campaign_group_path(conn, :update, campaign_group),
          campaign_group: @update_attrs
        )

      assert redirected_to(conn) == Routes.campaign_group_path(conn, :show, campaign_group)

      conn = get(conn, Routes.campaign_group_path(conn, :show, campaign_group))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, campaign_group: campaign_group} do
      conn =
        put(conn, Routes.campaign_group_path(conn, :update, campaign_group),
          campaign_group: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Campaign group"
    end
  end

  describe "delete campaign_group" do
    setup [:create_campaign_group]

    test "deletes chosen campaign_group", %{conn: conn, campaign_group: campaign_group} do
      conn = delete(conn, Routes.campaign_group_path(conn, :delete, campaign_group))
      assert redirected_to(conn) == Routes.campaign_group_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.campaign_group_path(conn, :show, campaign_group))
      end
    end
  end

  defp create_campaign_group(_) do
    campaign_group = fixture(:campaign_group)
    {:ok, campaign_group: campaign_group}
  end
end
