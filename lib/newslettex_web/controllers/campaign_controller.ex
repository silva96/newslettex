defmodule NewslettexWeb.CampaignController do
  use NewslettexWeb, :controller

  alias Newslettex.Newsletter
  alias Newslettex.Newsletter.Campaign

  def index(conn, _params) do
    campaigns = Newsletter.list_campaigns()

    conn
    |> assign(:page_title, "Campaigns")
    |> render("index.html", campaigns: campaigns)
  end

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Newsletter.change_campaign(%Campaign{})

    campaign_groups = Newsletter.list_campaign_groups() |> Enum.map(&{&1.name, &1.id})
    lists = Newsletter.list_lists() |> Enum.map(&{&1.name, &1.id})

    IO.puts(inspect(lists))

    conn
    |> assign(:page_title, "New Campaign")
    |> render("new.html", changeset: changeset, campaign_groups: campaign_groups, lists: lists)
  end

  def create(conn, %{"campaign" => campaign_params}) do
    case Newsletter.create_campaign(campaign_params) do
      {:ok, campaign} ->
        conn
        |> put_flash(:info, "Campaign created successfully.")
        |> redirect(to: Routes.campaign_path(conn, :show, campaign))

      {:error, %Ecto.Changeset{} = changeset} ->
        campaign_groups = Newsletter.list_campaign_groups() |> Enum.map(&{&1.name, &1.id})
        lists = Newsletter.list_lists() |> Enum.map(&{&1.name, &1.id})

        render(conn, "new.html",
          changeset: changeset,
          campaign_groups: campaign_groups,
          lists: lists
        )
    end
  end

  def show(conn, %{"id" => id}) do
    campaign = Newsletter.get_campaign!(id)

    conn
    |> assign(:page_title, "#{campaign.name} details")
    |> render("show.html", campaign: campaign)
  end

  def edit(conn, %{"id" => id}) do
    campaign = Newsletter.get_campaign!(id)
    changeset = Newsletter.change_campaign(campaign)

    conn
    |> assign(:page_title, "Edit #{campaign.name}")
    |> render("edit.html", campaign: campaign, changeset: changeset)
  end

  def update(conn, %{"id" => id, "campaign" => campaign_params}) do
    campaign = Newsletter.get_campaign!(id)

    case Newsletter.update_campaign(campaign, campaign_params) do
      {:ok, campaign} ->
        conn
        |> put_flash(:info, "Campaign updated successfully.")
        |> redirect(to: Routes.campaign_path(conn, :show, campaign))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", campaign: campaign, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    campaign = Newsletter.get_campaign!(id)
    {:ok, _campaign} = Newsletter.delete_campaign(campaign)

    conn
    |> put_flash(:info, "Campaign deleted successfully.")
    |> redirect(to: Routes.campaign_path(conn, :index))
  end
end
