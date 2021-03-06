defmodule Newslettex.NewsletterTest do
  use Newslettex.DataCase

  alias Newslettex.Newsletter

  describe "campaigns" do
    alias Newslettex.Newsletter.Campaign

    @valid_attrs %{
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

    def campaign_fixture(attrs \\ %{}) do
      {:ok, campaign} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Newsletter.create_campaign()

      campaign
    end

    test "list_campaigns/0 returns all campaigns" do
      campaign = campaign_fixture()
      assert Newsletter.list_campaigns() == [campaign]
    end

    test "get_campaign!/1 returns the campaign with given id" do
      campaign = campaign_fixture()
      assert Newsletter.get_campaign!(campaign.id) == campaign
    end

    test "create_campaign/1 with valid data creates a campaign" do
      assert {:ok, %Campaign{} = campaign} = Newsletter.create_campaign(@valid_attrs)
      assert campaign.body == "some body"
      assert campaign.bounced == 42
      assert campaign.clicked == 42
      assert campaign.complained == 42
      assert campaign.contacts_size == 42
      assert campaign.delivered == 42
      assert campaign.name == "some name"
      assert campaign.opened == 42
      assert campaign.rejected == 42
      assert campaign.sender == "some sender"
      assert campaign.sent == 42
      assert campaign.smtp_message_id == "some smtp_message_id"
      assert campaign.status == :draft
      assert campaign.subject == "some subject"
      assert campaign.unique_clicked == 42
      assert campaign.unique_opened == 42
    end

    test "create_campaign/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Newsletter.create_campaign(@invalid_attrs)
    end

    test "update_campaign/2 with valid data updates the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{} = campaign} = Newsletter.update_campaign(campaign, @update_attrs)
      assert campaign.body == "some updated body"
      assert campaign.bounced == 43
      assert campaign.clicked == 43
      assert campaign.complained == 43
      assert campaign.contacts_size == 43
      assert campaign.delivered == 43
      assert campaign.name == "some updated name"
      assert campaign.opened == 43
      assert campaign.rejected == 43
      assert campaign.sender == "some updated sender"
      assert campaign.sent == 43
      assert campaign.smtp_message_id == "some updated smtp_message_id"
      assert campaign.status == :sending
      assert campaign.subject == "some updated subject"
      assert campaign.unique_clicked == 43
      assert campaign.unique_opened == 43
    end

    test "update_campaign/2 with invalid data returns error changeset" do
      campaign = campaign_fixture()
      assert {:error, %Ecto.Changeset{}} = Newsletter.update_campaign(campaign, @invalid_attrs)
      assert campaign == Newsletter.get_campaign!(campaign.id)
    end

    test "delete_campaign/1 deletes the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{}} = Newsletter.delete_campaign(campaign)
      assert_raise Ecto.NoResultsError, fn -> Newsletter.get_campaign!(campaign.id) end
    end

    test "change_campaign/1 returns a campaign changeset" do
      campaign = campaign_fixture()
      assert %Ecto.Changeset{} = Newsletter.change_campaign(campaign)
    end
  end

  describe "campaign_contact_events" do
    alias Newslettex.Newsletter.CampaignContactEvent

    @valid_attrs %{event_type: :send, smtp_message_id: "some smtp_message_id"}
    @update_attrs %{event_type: :delivery, smtp_message_id: "some updated smtp_message_id"}
    @invalid_attrs %{event_type: nil, smtp_message_id: nil}

    def campaign_contact_event_fixture(attrs \\ %{}) do
      {:ok, campaign_contact_event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Newsletter.create_campaign_contact_event()

      campaign_contact_event
    end

    test "list_campaign_contact_events/0 returns all campaign_contact_events" do
      campaign_contact_event = campaign_contact_event_fixture()
      assert Newsletter.list_campaign_contact_events() == [campaign_contact_event]
    end

    test "get_campaign_contact_event!/1 returns the campaign_contact_event with given id" do
      campaign_contact_event = campaign_contact_event_fixture()

      assert Newsletter.get_campaign_contact_event!(campaign_contact_event.id) ==
               campaign_contact_event
    end

    test "create_campaign_contact_event/1 with valid data creates a campaign_contact_event" do
      assert {:ok, %CampaignContactEvent{} = campaign_contact_event} =
               Newsletter.create_campaign_contact_event(@valid_attrs)

      assert campaign_contact_event.event_type == :send
      assert campaign_contact_event.smtp_message_id == "some smtp_message_id"
    end

    test "create_campaign_contact_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               Newsletter.create_campaign_contact_event(@invalid_attrs)
    end

    test "update_campaign_contact_event/2 with valid data updates the campaign_contact_event" do
      campaign_contact_event = campaign_contact_event_fixture()

      assert {:ok, %CampaignContactEvent{} = campaign_contact_event} =
               Newsletter.update_campaign_contact_event(campaign_contact_event, @update_attrs)

      assert campaign_contact_event.event_type == :delivery
      assert campaign_contact_event.smtp_message_id == "some updated smtp_message_id"
    end

    test "update_campaign_contact_event/2 with invalid data returns error changeset" do
      campaign_contact_event = campaign_contact_event_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Newsletter.update_campaign_contact_event(campaign_contact_event, @invalid_attrs)

      assert campaign_contact_event ==
               Newsletter.get_campaign_contact_event!(campaign_contact_event.id)
    end

    test "delete_campaign_contact_event/1 deletes the campaign_contact_event" do
      campaign_contact_event = campaign_contact_event_fixture()

      assert {:ok, %CampaignContactEvent{}} =
               Newsletter.delete_campaign_contact_event(campaign_contact_event)

      assert_raise Ecto.NoResultsError, fn ->
        Newsletter.get_campaign_contact_event!(campaign_contact_event.id)
      end
    end

    test "change_campaign_contact_event/1 returns a campaign_contact_event changeset" do
      campaign_contact_event = campaign_contact_event_fixture()
      assert %Ecto.Changeset{} = Newsletter.change_campaign_contact_event(campaign_contact_event)
    end
  end

  describe "campaign_groups" do
    alias Newslettex.Newsletter.CampaignGroup

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def campaign_group_fixture(attrs \\ %{}) do
      {:ok, campaign_group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Newsletter.create_campaign_group()

      campaign_group
    end

    test "list_campaign_groups/0 returns all campaign_groups" do
      campaign_group = campaign_group_fixture()
      assert Newsletter.list_campaign_groups() == [campaign_group]
    end

    test "get_campaign_group!/1 returns the campaign_group with given id" do
      campaign_group = campaign_group_fixture()
      assert Newsletter.get_campaign_group!(campaign_group.id) == campaign_group
    end

    test "create_campaign_group/1 with valid data creates a campaign_group" do
      assert {:ok, %CampaignGroup{} = campaign_group} =
               Newsletter.create_campaign_group(@valid_attrs)

      assert campaign_group.name == "some name"
    end

    test "create_campaign_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Newsletter.create_campaign_group(@invalid_attrs)
    end

    test "update_campaign_group/2 with valid data updates the campaign_group" do
      campaign_group = campaign_group_fixture()

      assert {:ok, %CampaignGroup{} = campaign_group} =
               Newsletter.update_campaign_group(campaign_group, @update_attrs)

      assert campaign_group.name == "some updated name"
    end

    test "update_campaign_group/2 with invalid data returns error changeset" do
      campaign_group = campaign_group_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Newsletter.update_campaign_group(campaign_group, @invalid_attrs)

      assert campaign_group == Newsletter.get_campaign_group!(campaign_group.id)
    end

    test "delete_campaign_group/1 deletes the campaign_group" do
      campaign_group = campaign_group_fixture()
      assert {:ok, %CampaignGroup{}} = Newsletter.delete_campaign_group(campaign_group)

      assert_raise Ecto.NoResultsError, fn ->
        Newsletter.get_campaign_group!(campaign_group.id)
      end
    end

    test "change_campaign_group/1 returns a campaign_group changeset" do
      campaign_group = campaign_group_fixture()
      assert %Ecto.Changeset{} = Newsletter.change_campaign_group(campaign_group)
    end
  end

  describe "contacts" do
    alias Newslettex.Newsletter.Contact

    @valid_attrs %{email: "some email", unsuscribed: true}
    @update_attrs %{email: "some updated email", unsuscribed: false}
    @invalid_attrs %{email: nil, unsuscribed: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Newsletter.create_contact()

      contact
    end

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Newsletter.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Newsletter.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Newsletter.create_contact(@valid_attrs)
      assert contact.email == "some email"
      assert contact.unsuscribed == true
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Newsletter.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{} = contact} = Newsletter.update_contact(contact, @update_attrs)
      assert contact.email == "some updated email"
      assert contact.unsuscribed == false
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Newsletter.update_contact(contact, @invalid_attrs)
      assert contact == Newsletter.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Newsletter.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Newsletter.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Newsletter.change_contact(contact)
    end
  end

  describe "lists" do
    alias Newslettex.Newsletter.List

    @valid_attrs %{name: "some name", status: :importing}
    @update_attrs %{name: "some updated name", status: :imported}
    @invalid_attrs %{name: nil, status: nil}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Newsletter.create_list()

      list
    end

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert Newsletter.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert Newsletter.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = Newsletter.create_list(@valid_attrs)
      assert list.name == "some name"
      assert list.status == :importing
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Newsletter.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, %List{} = list} = Newsletter.update_list(list, @update_attrs)
      assert list.name == "some updated name"
      assert list.status == :imported
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = Newsletter.update_list(list, @invalid_attrs)
      assert list == Newsletter.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = Newsletter.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> Newsletter.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = Newsletter.change_list(list)
    end
  end
end
