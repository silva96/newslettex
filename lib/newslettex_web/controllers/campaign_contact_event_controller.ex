defmodule NewslettexWeb.CampaignContactEventController do
  use NewslettexWeb, :controller

  alias Newslettex.Newsletter
  alias Newslettex.Newsletter.CampaignContactEvent

  def index(conn, _params) do
    campaign_contact_events = Newsletter.list_campaign_contact_events()
    render(conn, "index.html", campaign_contact_events: campaign_contact_events)
  end

  def new(conn, _params) do
    changeset = Newsletter.change_campaign_contact_event(%CampaignContactEvent{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"campaign_contact_event" => campaign_contact_event_params}) do
    case Newsletter.create_campaign_contact_event(campaign_contact_event_params) do
      {:ok, campaign_contact_event} ->
        conn
        |> put_flash(:info, "Campaign contact event created successfully.")
        |> redirect(to: Routes.campaign_contact_event_path(conn, :show, campaign_contact_event))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    campaign_contact_event = Newsletter.get_campaign_contact_event!(id)
    render(conn, "show.html", campaign_contact_event: campaign_contact_event)
  end

  def edit(conn, %{"id" => id}) do
    campaign_contact_event = Newsletter.get_campaign_contact_event!(id)
    changeset = Newsletter.change_campaign_contact_event(campaign_contact_event)

    render(conn, "edit.html", campaign_contact_event: campaign_contact_event, changeset: changeset)
  end

  def update(conn, %{"id" => id, "campaign_contact_event" => campaign_contact_event_params}) do
    campaign_contact_event = Newsletter.get_campaign_contact_event!(id)

    case Newsletter.update_campaign_contact_event(
           campaign_contact_event,
           campaign_contact_event_params
         ) do
      {:ok, campaign_contact_event} ->
        conn
        |> put_flash(:info, "Campaign contact event updated successfully.")
        |> redirect(to: Routes.campaign_contact_event_path(conn, :show, campaign_contact_event))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html",
          campaign_contact_event: campaign_contact_event,
          changeset: changeset
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    campaign_contact_event = Newsletter.get_campaign_contact_event!(id)

    {:ok, _campaign_contact_event} =
      Newsletter.delete_campaign_contact_event(campaign_contact_event)

    conn
    |> put_flash(:info, "Campaign contact event deleted successfully.")
    |> redirect(to: Routes.campaign_contact_event_path(conn, :index))
  end
end
