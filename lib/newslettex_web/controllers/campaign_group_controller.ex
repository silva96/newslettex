defmodule NewslettexWeb.CampaignGroupController do
  use NewslettexWeb, :controller

  alias Newslettex.Newsletter
  alias Newslettex.Newsletter.CampaignGroup

  def index(conn, _params) do
    campaign_groups = Newsletter.list_campaign_groups()
    render(conn, "index.html", campaign_groups: campaign_groups)
  end

  def new(conn, _params) do
    changeset = Newsletter.change_campaign_group(%CampaignGroup{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"campaign_group" => campaign_group_params}) do
    case Newsletter.create_campaign_group(campaign_group_params) do
      {:ok, campaign_group} ->
        conn
        |> put_flash(:info, "Campaign group created successfully.")
        |> redirect(to: Routes.campaign_group_path(conn, :show, campaign_group))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    campaign_group = Newsletter.get_campaign_group!(id)
    render(conn, "show.html", campaign_group: campaign_group)
  end

  def edit(conn, %{"id" => id}) do
    campaign_group = Newsletter.get_campaign_group!(id)
    changeset = Newsletter.change_campaign_group(campaign_group)
    render(conn, "edit.html", campaign_group: campaign_group, changeset: changeset)
  end

  def update(conn, %{"id" => id, "campaign_group" => campaign_group_params}) do
    campaign_group = Newsletter.get_campaign_group!(id)

    case Newsletter.update_campaign_group(campaign_group, campaign_group_params) do
      {:ok, campaign_group} ->
        conn
        |> put_flash(:info, "Campaign group updated successfully.")
        |> redirect(to: Routes.campaign_group_path(conn, :show, campaign_group))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", campaign_group: campaign_group, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    campaign_group = Newsletter.get_campaign_group!(id)
    {:ok, _campaign_group} = Newsletter.delete_campaign_group(campaign_group)

    conn
    |> put_flash(:info, "Campaign group deleted successfully.")
    |> redirect(to: Routes.campaign_group_path(conn, :index))
  end
end
